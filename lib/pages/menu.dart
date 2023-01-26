import 'package:flutter/material.dart';
import '../navigation/navogation.dart';
import '../theme/theme.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: MyTheme.colorGradient(),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(child: _MyWidgetBodyMenu()),
      ),
    );
  }
}

class _MyWidgetBodyMenu extends StatelessWidget {
  const _MyWidgetBodyMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                  MyNavigationCategories().namePage[3],
                  arguments: 3);
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Center(
                child: Text(
                  'burgers',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                  MyNavigationCategories().namePage[0],
                  arguments: 0);
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Center(
                child: Text(
                  'cold drinks',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                  MyNavigationCategories().namePage[1],
                  arguments: 1);
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Center(
                child: Text(
                  'hot drinks',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                  MyNavigationCategories().namePage[2],
                  arguments: 2);
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Center(
                child: Text(
                  'pizza',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
