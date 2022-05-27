import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  MaterialColor mainColor = Colors.red;

  void changeThemeColor(MaterialColor color) {
    mainColor = color;
    notifyListeners();
  }
}
