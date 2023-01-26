import 'package:flutter/cupertino.dart';
import '../page_factory/page_factory.dart';

class MyNavigationCategories {
  final factor = PageFactoryCategories();
  final List namePage = ['/coldDrinks', '/hotDrinks', '/pizza', '/burger'];
  final initRoute = '/';
  Map<String, WidgetBuilder> get routePage => {
        initRoute: (_) => factor.mainPage(),
        namePage[0]: (_) => factor.coldDrinks(),
        namePage[1]: (_) => factor.hotDrinks(),
        namePage[2]: (_) => factor.pizza(),
        namePage[3]: (_) => factor.burger(),
      };
}
