import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectIndex = 0;
  int get selectedIndex => _selectIndex;
  void setIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }

  void navigateToHome() {
    setIndex(0);
  }

  void navigateToDiscover() {
    setIndex(1);
  }

  void navigateToProfile() {
    setIndex(2);
  }
}
