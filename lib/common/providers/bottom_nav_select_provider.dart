import 'package:flutter/material.dart';

class BottomNavSelectProvider extends ChangeNotifier {
  int currentScreen = 0;

  int get fetchCurrentScreenIndex {
    return currentScreen;
  }

  void updateScreenIndex(int newIndex) {
    currentScreen = newIndex;
    notifyListeners();
  }
}
