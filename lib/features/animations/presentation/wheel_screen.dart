import 'package:app_configurations/features/settings/providers/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WheelScreen extends ConsumerStatefulWidget {
  const WheelScreen({super.key});

  @override
  ConsumerState<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends ConsumerState<WheelScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  double _angle = 0;
  double _speed = 0; // velocidad de giro
  bool _pressed = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            if (!_pressed && _speed != 0) {
              setState(() {
                _angle += _speed;
              });
            }
          });

    _controller.repeat();
  }

  void _startSpin(DragUpdateDetails details) {
    final animationsEnabled = ref.read(appAnimationControllerProvider);

    if (!animationsEnabled) return;

    final dx = details.delta.dx;

    setState(() {
      _pressed = false;

      // Derecha = horario, izquierda = antihorario
      _speed = dx * 0.03;

      // Evita que gire demasiado lento
      if (_speed > 0 && _speed < 0.02) _speed = 0.02;
      if (_speed < 0 && _speed > -0.02) _speed = -0.02;
    });
  }

  void _stopSpin() {
    setState(() {
      _pressed = true;
      _speed = 0;
    });
  }

  void _resumeTouch() {
    setState(() {
      _pressed = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _disc() {
    return Transform.rotate(
      angle: _angle,
      child: Container(
        width: 230,
        height: 230,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black87,
        ),
        child: ClipOval(
          child: Image.asset('assets/images/wheel.png', fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      appBar: AppBar(
        title: const Text('Disco giratorio'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: _startSpin,

          // Se detiene mientras está pulsado
          onTapDown: (_) => _stopSpin(),
          onTapUp: (_) => _resumeTouch(),
          onTapCancel: _resumeTouch,

          child: _disc(),
        ),
      ),
    );
  }
}
