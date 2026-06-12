import 'package:app_configurations/features/settings/providers/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ZoomScreen extends ConsumerStatefulWidget {
  const ZoomScreen({super.key});

  @override
  ConsumerState<ZoomScreen> createState() => _ZoomScreenState();
}

class _ZoomScreenState extends ConsumerState<ZoomScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  double _currentScale = 1.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.35).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeInOut,
      ),
    );

    _scaleAnimation.addListener(() {
      setState(() {
        _currentScale = _scaleAnimation.value;
      });
    });
  }

  Future<void> _zoomAndReturn() async {
    final animationsEnabled = ref.read(appAnimationControllerProvider);

    if (!animationsEnabled) return;

    await _controller.forward(from: 0);
    await Future.delayed(const Duration(milliseconds: 200));
    await _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Transform.scale(
        scale: _currentScale,
        child: Image.asset(
          'assets/images/wheel.png',
          width: 320,
          height: 220,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202124),
      appBar: AppBar(
        title: const Text('Zoom con doble tap'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: GestureDetector(onDoubleTap: _zoomAndReturn, child: _image()),
      ),
    );
  }
}
