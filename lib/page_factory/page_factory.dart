import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/categories%20in%20navigation/cold_drinks.dart';
import 'package:flutter_application_1/pages/home/home.dart';
import 'package:provider/provider.dart';
import '../categories in navigation/hot_drinks.dart';
import '../categories in navigation/burger.dart';
import '../categories in navigation/pizza.dart';
import '../entiti/categorys.dart';
import '../model_Bar_Bottom.dart';

class PageFactoryCategories {
  Widget mainPage() => MultiProvider(
        providers: [
          ChangeNotifierProvider<CategoriesModel>(
            create: (_) => CategoriesModel(),
          ),
          ChangeNotifierProvider<ClassBarBottomModel>(
            create: (_) => ClassBarBottomModel(),
          ),
        ],
        child: HomeScreen(),
      );

  Widget coldDrinks() => const ColdDrinks();
  Widget hotDrinks() => const HotDrinks();
  Widget pizza() => const Pizza();
  Widget burger() => const Burger();
}
