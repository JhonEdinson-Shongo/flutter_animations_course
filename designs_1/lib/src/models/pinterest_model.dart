import 'package:flutter/material.dart';

class PinterestModel with ChangeNotifier {
  int _currentItem = 0;

  int get currentItem => _currentItem;

  set currentItem(int value) {
    _currentItem = value;
    notifyListeners();
  }
}