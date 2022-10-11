import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/navigation/navogation.dart';
import 'package:provider/provider.dart';
import '../entiti/sport.dart';
import '../theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: MyTheme.colorGradient(),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(child: MyWidgetBode()),
      ),
    );
  }
}

class MyWidgetBode extends StatelessWidget {
  const MyWidgetBode({super.key});
  @override
  Widget build(BuildContext context) {
    final sport = context.read<SportModel>();
    final length = sport.vidSportas.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Text(
            'Хуета большая',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: length,
            itemBuilder: (context, index) => Items(index: index),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.75,
            ),
          ),
        )
      ],
    );
  }
}

class Items extends StatelessWidget {
  const Items({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final sport = context.read<SportModel>();
    const double size = 80;
    List icon = [
      Icons.sports_football,
      Icons.sports_hockey,
      Icons.sports_tennis,
      Icons.water_outlined,
    ];
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(MyNavigation().namePage[index], arguments: index);
        },
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xfffdfdff),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(3, 2),
                  color: Colors.blueGrey,
                )
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        sport.vidSportas[index].img,
                      ),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(size / 2),
                    ),
                  ),
                ),
              ),
              Text(
                sport.vidSportas[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const Text(
                'хуета мелкая',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon[index],
                    color: Color.fromARGB(255, 69, 153, 202),
                    size: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
