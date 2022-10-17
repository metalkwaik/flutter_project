import 'package:flutter_application_1/entiti/sport.dart';

class CommunismModel extends SportModel {
  CommunismModel({required this.sportKey});

  var a = true;
  int sportKey;
  Sport sport(context) {
    Sport item = getSport(context, sportKey);
    return item;
  }

  bool tog() {
    a = !a;
    notifyListeners();
    return a;
  }
}
