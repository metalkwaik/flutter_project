import 'package:flutter/material.dart';

class Categories {
  final String name;
  final String discri;
  final String img;
  Categories({required this.discri, required this.img, required this.name});
}

class CategoriesModel extends ChangeNotifier {
  final Map<int, Categories> _vidCategories = {
    0: Categories(img: '', name: 'coldDrinks', discri: ' chose coldDrinks'),
    1: Categories(
      img: '',
      name: 'hotDrinks',
      discri: ' chose hotDrinks',
    ),
    2: Categories(
      img: '',
      name: 'pizza',
      discri: 'chose pizza',
    ),
    3: Categories(
      img: '',
      name: 'burger',
      discri: 'chose burger',
    )
  };

  Categories getCategories(context, int index) {
    return _vidCategories.values.toList()[index];
  }

  List<Categories> get vidCategories => _vidCategories.values.toList();
}

class CategoriesModelBurgerSize extends ChangeNotifier {
  final Map<int, Categories> _vidCategoriesModelBurgerSize = {
    0: Categories(
      img: '',
      name: 'small burger size',
      discri: '',
    ),
    1: Categories(
      img: '',
      name: 'average burger size',
      discri: '',
    ),
    2: Categories(
      img: '',
      name: 'large burger size',
      discri: '',
    )
  };

  Categories getCategoriesCategoriesModelBurgerSize(context, int index) {
    return _vidCategoriesModelBurgerSize.values.toList()[index];
  }

  List<Categories> get vidCategoriesModelBurgerSize =>
      _vidCategoriesModelBurgerSize.values.toList();
}
