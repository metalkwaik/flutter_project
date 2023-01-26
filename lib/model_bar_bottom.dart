import 'package:flutter/cupertino.dart';

class ClassBarBottomModel extends ChangeNotifier {
  var currentIndexPage = 0;

  setScreen(int index) {
    currentIndexPage = index;
    notifyListeners();
    print(currentIndexPage);
  }
}
