import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/navigation/navogation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final myNavigation = MyNavigation();
    return MaterialApp(
      routes: myNavigation.routePage,
      initialRoute: myNavigation.initRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
