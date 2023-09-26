import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode appMode = ThemeMode.light;

  void changeMode(ThemeMode newMode) {
    if (appMode == newMode) {
      return;
    }
    appMode = newMode;
    notifyListeners();
  }

  bool isDark() {
    return appMode == ThemeMode.dark;
  }
}
