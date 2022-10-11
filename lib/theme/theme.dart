import 'package:flutter/material.dart';

abstract class MyTheme {
  static colorGradient() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
          0.3,
          0.5,
          0.7
        ],
            colors: [
          Colors.green,
          Color.fromARGB(219, 255, 234, 1),
          Colors.green,
        ]));
  }
}
