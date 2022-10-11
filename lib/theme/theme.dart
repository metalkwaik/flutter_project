import 'package:flutter/material.dart';

abstract class MyTheme {
  static colorGradient() {
    return const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [
          0.3,
          1
        ],
        colors: [
          Color.fromARGB(219, 14, 255, 215),
          Color.fromARGB(255, 69, 153, 202),
        ]);
  }

  static colorGradient2() {
    return const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [
          0.3,
          1
        ],
        colors: [
          Color.fromARGB(255, 69, 153, 202),
          Color.fromARGB(219, 14, 255, 215),
        ]);
  }
}
