import 'package:flutter/material.dart';

class Sport {
  final String name;
  final String discri;
  final String img;
  Sport({required this.discri, required this.img, required this.name});
}

class SportModel extends ChangeNotifier {
  final Map<int, Sport> _vidSporta = {
    0: Sport(
        img: 'asset/football.jpg', name: 'football', discri: ' chose ivent'),
    1: Sport(
      img: 'asset/hockey.jpg',
      name: 'hockey',
      discri: ' chose ivent',
    ),
    2: Sport(
      img: 'asset/tennis.webp',
      name: 'tennis',
      discri: 'chose ivent',
    ),
    3: Sport(
      img: 'asset/swim.jpg',
      name: 'swim',
      discri: 'chose ivent',
    )
  };

  Sport getSport(context, int index) {
    return _vidSporta.values.toList()[index];
  }

  List<Sport> get vidSportas => _vidSporta.values.toList();
}
