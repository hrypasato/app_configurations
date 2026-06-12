import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  bool _animationsEnabled = true;

  ThemeMode get themeMode => _themeMode;
  bool get animationsEnabled => _animationsEnabled;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme(bool value) {
    _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void toggleAnimations(bool value) {
    _animationsEnabled = value;
    notifyListeners();
  }
}