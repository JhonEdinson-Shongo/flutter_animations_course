import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier {
  String _versionApp = '0.1.0';

  String get versionApp => _versionApp;
  
  set versionApp(String value) {
    _versionApp = value;
    notifyListeners();
  }
}