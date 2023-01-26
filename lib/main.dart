import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/navogation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final myNavigation = MyNavigationCategories();
    return MaterialApp(
      routes: myNavigation.routePage,
      initialRoute: myNavigation.initRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
