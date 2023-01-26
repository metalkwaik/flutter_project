import 'package:flutter/material.dart';

class Categories {
  final String name;
  final String discri;
  final String img;
  Categories({required this.discri, required this.img, required this.name});
}

class CategoriesModel extends ChangeNotifier {
  final Map<int, Categories> _vidCategories = {
    0: Categories(img: '', name: 'coldDrinks', discri: 'chose coldDrinks'),
    1: Categories(
      img: '',
      name: 'hotDrinks',
      discri: 'chose hotDrinks',
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

  Categories getSport(context, int index) {
    return _vidCategories.values.toList()[index];
  }

  List<Categories> get vidSportas => _vidCategories.values.toList();
}
