import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  MaterialColor mainColor = Colors.red;
  Brightness brightness = Brightness.light;

  void changeThemeColor(MaterialColor color) {
    mainColor = color;
    notifyListeners();
  }

  void changeToDarktheme(bool isDarkTheme) {
    if (isDarkTheme == true) {
      brightness = Brightness.dark;
    } else {
      brightness = Brightness.light;
    }

    notifyListeners();
  }
}
