import 'package:flutter/material.dart';

class AppTheme {
  final Color _primary = Colors.indigo;
  final Color _secondary = Colors.indigoAccent;
  final Color _white = Colors.white;
  final Color _black = Colors.black;
  final Color _colorText = Colors.black87;
  final Color _colorTextSecondary = Colors.black87;
  final Color _colorTextSecondary2 = Colors.black87;
  final double _fontSizeFactor = 1;

  Color get primary => _primary;
  Color get secondary => _secondary;
  Color get white => _white;
  Color get black => _black;
  Color get colorText => _colorText;
  Color get colorTextSecondary => _colorTextSecondary;
  Color get colorTextSecondary2 => _colorTextSecondary2;
  double get fontSizeFactor => _fontSizeFactor;

  ThemeData get themeDark => ThemeData.dark().copyWith(
        primaryColor: primary,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: ThemeData().textTheme.apply(
            bodyColor: colorText,
            fontFamily: 'Poppins',
            fontSizeFactor: fontSizeFactor),
        scaffoldBackgroundColor: Colors.black,
      );

  ThemeData get themeLight => ThemeData.light().copyWith(
        primaryColor: primary,
        appBarTheme: AppBarTheme(
          color: primary,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: ThemeData().textTheme.apply(
            bodyColor: colorText,
            fontFamily: 'Poppins',
            fontSizeFactor: fontSizeFactor),
        scaffoldBackgroundColor: Colors.white,
      );

  ThemeData get themeCustom => ThemeData.light().copyWith(
        primaryColor: primary,
        appBarTheme: AppBarTheme(
          color: primary,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: ThemeData().textTheme.apply(
            bodyColor: colorText,
            fontFamily: 'Poppins',
            fontSizeFactor: fontSizeFactor),
        scaffoldBackgroundColor: Colors.white,
      );
}
