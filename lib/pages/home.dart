import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/navigation/navogation.dart';
import 'package:provider/provider.dart';
import '../entiti/sport.dart';
import '../theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyWidgetBode(),
    );
  }
}

class MyWidgetBode extends StatelessWidget {
  const MyWidgetBode({super.key});
  @override
  Widget build(BuildContext context) {
    final sport = context.read<SportModel>();
    final length = sport.vidSportas.length;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: MyTheme.colorGradient(),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            heightFactor: 2,
            child: Text(
              'choose a sport',
              style: TextStyle(color: Colors.amber),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: length,
              itemBuilder: (context, index) => Items(index: index),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final sport = context.read<SportModel>();
    return Builder(
      builder: (context) {
        return InkWell(
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Text(sport.vidSportas[index].name,
                      style: const TextStyle(color: Colors.amber))),
              Image.asset(sport.vidSportas[index].img),
            ],
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(MyNavigation().namePage[index], arguments: index);
          },
        );
      },
    );
  }
}
