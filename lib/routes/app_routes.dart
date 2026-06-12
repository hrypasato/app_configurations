import 'package:app_configurations/features/animations/presentation/wheel_screen.dart';
import 'package:app_configurations/features/animations/presentation/zoom_screen.dart';
import 'package:app_configurations/features/settings/presentation/settings_screen.dart';
import 'package:app_configurations/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initial = '/';
  static const String home = '/home';
  static const String configuration = '/configuration';
  static const String zoom = '/zoom';
  static const String wheel = '/wheel';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const HomeScreen(),
    home: (context) => const HomeScreen(),
    configuration: (context) => const ConfigurationScreen(),
    zoom: (context) => const ZoomScreen(),
    wheel: (context) => const WheelScreen(),
  };
}
