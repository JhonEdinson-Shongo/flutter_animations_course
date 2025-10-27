import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { light, dark, custom }

class AppTheme with ChangeNotifier {
  static const Color primary = Colors.indigo;
  static const Color secondary = Colors.indigoAccent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  bool _isDarkTheme = false;
  bool _isCustomTheme = false;
  late ThemeData _currentTheme;
  final double _fontSizeFactor = 1.0;

  bool get isDarkTheme => _isDarkTheme;
  bool get isCustomTheme => _isCustomTheme;
  double get fontSizeFactor => _fontSizeFactor;
  ThemeData get currentTheme => _currentTheme;

  AppTheme(String theme) {
    switch (theme) {
      case 'dark':
        isDarkTheme = true;
        break;
      case 'custom':
        isCustomTheme = true;
        break;
      default:
        isDarkTheme = false;
        isCustomTheme = false;
    }
  }

  saveLocalTheme(String theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    _isCustomTheme = false;
    if (value) {
      _currentTheme = _themeDark;
      saveLocalTheme('dark');
    } else {
      _currentTheme = _themeLight;
      saveLocalTheme('light');
    }
    notifyListeners();
  }

  set isCustomTheme(bool value) {
    _isDarkTheme = false;
    _isCustomTheme = value;
    if (value) {
      _currentTheme = _themeCustom;
      saveLocalTheme('custom');
    } else if (_isDarkTheme) {
      _currentTheme = _themeDark;
      saveLocalTheme('dark');
    } else {
      _currentTheme = _themeLight;
      saveLocalTheme('light');
    }
    notifyListeners();
  }

  set currentTheme(ThemeData value) {
    _currentTheme = value;
    notifyListeners();
  }

  final ThemeData _themeDark = ThemeData.dark().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: primary,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: ThemeData().textTheme.apply(
          bodyColor: Colors.grey[300],
          fontFamily: 'Poppins',
        ),
  );

  final ThemeData _themeLight = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: ThemeData().textTheme.apply(
          bodyColor: Colors.black,
          fontFamily: 'Poppins',
        ),
    scaffoldBackgroundColor: Colors.white,
  );

  final ThemeData _themeCustom = ThemeData.light().copyWith(
    primaryColor: Colors.amber,
    appBarTheme: const AppBarTheme(
      color: Colors.orange,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: ThemeData().textTheme.apply(
          bodyColor: Colors.black,
          fontFamily: 'Poppins',
        ),
    scaffoldBackgroundColor: Colors.grey[100],
  );
}
