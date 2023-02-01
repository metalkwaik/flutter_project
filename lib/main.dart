import 'package:flutter/material.dart';
import 'navigation/main_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final mainNavigation = MainNavigation();
    return MaterialApp(
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
