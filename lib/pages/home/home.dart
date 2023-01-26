import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/menuScreen.dart';
import 'package:provider/provider.dart';
import '../../model_Bar_Bottom.dart';
import '../../theme/theme.dart';

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
    final buttom = context.watch<ClassBarBottomModel>();
    return Scaffold(
      bottomNavigationBar: _Buttom(),
      body: IndexedStack(
        index: buttom.currentIndexPage,
        children: [
          _Body(),
          MenuScreen(),
          Text('3'),
          Text('4'),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    final buttom = context.watch<ClassBarBottomModel>();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Text(
                    'Home page',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () => buttom.setScreen(3),
                child: Icon(Icons.person),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Buttom extends StatelessWidget {
  const _Buttom();
  final List textMenu = const [
    'Home',
    'menu',
    'Сart',
    'Profile',
  ];
  final List iconMenu = const [
    Icons.home,
    Icons.menu,
    Icons.add,
    Icons.account_box
  ];
  final List colorMenu = const [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    final buttom = context.watch<ClassBarBottomModel>();
    return BottomNavigationBar(
      onTap: (value) => buttom.setScreen(value),
      selectedItemColor: colorMenu[buttom.currentIndexPage],
      currentIndex: buttom.currentIndexPage,
      items: List.generate(
        textMenu.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(iconMenu[index]),
          label: textMenu[index],
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}
