import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bindings/api/api_data_json.dart';
import '../../../models/item_model.dart';

enum CategoryPage { burgers, drinks, snacks }

class MenuController extends ChangeNotifier {
  late FirebaseFirestore db;
  MenuController() {
    _init();
  }
  List<ProductData>? _productData = [];
  List<ProductData>? get productData => _productData;
  CategoryPage categoryPageName = CategoryPage.burgers;

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> productMap = jsonDecode(
        prefs.getString(Constenst.LOCOL_KEY_GLOBAL_VALUE.keys.first) as String);
    final ct = Products.fromJson(productMap).categoris!;
    switch (categoryPageName) {
      case CategoryPage.burgers:
        _productData = ct.burgers!.products as List<ProductData>;
        break;
      case CategoryPage.drinks:
        _productData = ct.drinks!.products;
        break;
      case CategoryPage.snacks:
        _productData = ct.snacks!.products;
        break;
    }
    print(categoryPageName);
    print(_productData!.first.name);
    notifyListeners();
  }

  var currentIndexPage = 0;
  setScreen(int index) {
    categoryPageName = CategoryPage.values[index];
    currentIndexPage = index;
    _init();
    notifyListeners();
  }
}
