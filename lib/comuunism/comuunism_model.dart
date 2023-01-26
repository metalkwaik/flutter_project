import '../entiti/categorys.dart';

class CommunismModel extends CategoriesModel {
  CommunismModel({required this.CategoriesKey});

  int CategoriesKey;
  Categories sport(context) {
    Categories item = getCategories(context, CategoriesKey);
    return item;
  }
}
