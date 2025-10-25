import 'package:flutter/material.dart';
import 'package:designs_1/src/themes/app_theme.dart';

class ThemeApp with ChangeNotifier {
  bool _isDarkTheme = false;
  bool _isCustomTheme = false;
  late ThemeData _currentTheme;

  static final AppTheme appTheme = AppTheme();

  ThemeApp() {
    _currentTheme = ThemeData.light();
  }

  bool get isDarkTheme => _isDarkTheme;
  bool get isCustomTheme => _isCustomTheme;
  ThemeData get currentTheme => _currentTheme;

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    _isCustomTheme = false;
    if (value) {
      _currentTheme = appTheme.themeDark;
    } else {
      _currentTheme = appTheme.themeLight;
    }
    notifyListeners();
  }

  set isCustomTheme(bool value) {
    _isDarkTheme = false;
    _isCustomTheme = value;
    if (value) {
      _currentTheme = appTheme.themeCustom;
    } else if (_isDarkTheme) {
      _currentTheme = appTheme.themeDark;
    } else {
      _currentTheme = appTheme.themeLight;
    }
    notifyListeners();
  }

  set currentTheme(ThemeData value) {
    _currentTheme = value;
    notifyListeners();
  }
}