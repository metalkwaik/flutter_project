import 'package:flutter/material.dart';

class Mytext extends StatelessWidget {
  const Mytext({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        wordSpacing: 1.5,
        letterSpacing: 0.3,
        height: 1.3,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
    );
  }
}
