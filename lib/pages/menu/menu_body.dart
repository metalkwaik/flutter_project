import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_controller/menu_controller.dart';

List<Widget> listWidgetPage = [
  const BurgerPage(),
  const Text('2'),
];

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuController>();
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _TitleCategory(
              title: controller.category[controller.currentIndexPage],
            ),
            listWidgetPage.length > controller.currentIndexPage
                ? IndexedStack(
                    index: controller.currentIndexPage,
                    children: listWidgetPage,
                  )
                : const _ErrorPage(),
          ],
        ),
      ),
    );
  }
}

class BurgerPage extends StatelessWidget {
  const BurgerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 100,
      itemBuilder: (_, int index) => _ItemBuilder(index: index),
    );
  }
}

class _ItemBuilder extends StatelessWidget {
  final int index;
  const _ItemBuilder({required this.index});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuController>();
    return Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(8),
        color: Colors.teal,
        child: Row(
          children: [
            Container(
                color: Colors.teal[200], child: const FlutterLogo(size: 100)),
            const SizedBox(width: 18),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () => controller.setap(),
                    child: const Text('data'))
              ],
            )
          ],
        ));
  }
}

class _TitleCategory extends StatelessWidget {
  final String title;
  const _TitleCategory({required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}

class _ErrorPage extends StatelessWidget {
  const _ErrorPage();
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('нет позиций'));
  }
}
