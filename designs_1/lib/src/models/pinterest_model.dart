import 'package:flutter/material.dart';

class PinterestModel with ChangeNotifier {
  int _currentItem = 0;
  bool _showMenu = true;

  bool get showMenu => _showMenu;

  int get currentItem => _currentItem;

  set showMenu(bool value) {
    _showMenu = value;
    notifyListeners();
  }

  set currentItem(int value) {
    _currentItem = value;
    notifyListeners();
  }
}