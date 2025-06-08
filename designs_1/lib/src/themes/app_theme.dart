import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static const Color secondary = Colors.indigoAccent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color colorText = Colors.black87;
  static const Color colorTextSecondary = Colors.black87;
  static const Color colorTextSecondary2 = Colors.black87;
  static const double fontSizeFactor = 1;

  static final ThemeData themeLight = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    textTheme: ThemeData().textTheme.apply(bodyColor: colorText, fontFamily: 'Poppins', fontSizeFactor: fontSizeFactor),
    scaffoldBackgroundColor: white,
  );
}