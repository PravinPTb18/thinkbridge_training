import 'package:flutter/cupertino.dart';

class NewData with ChangeNotifier {
  int age = 0;
  int get userAge => age;

  void increaseAge() {
    age++;
    notifyListeners();
  }

  void decreaseAge() {
    age--;
    notifyListeners();
  }
}
