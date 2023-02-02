import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menu_controller/menu_controller.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: CategoryPage.values.length,
        itemBuilder: (context, index) => _ItemBuild(index: index),
      ),
    );
  }
}

class _ItemBuild extends StatelessWidget {
  final int index;
  const _ItemBuild({required this.index});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuController>();
    final title = CategoryPage.values[index].name.toString();
    final bool select = title == controller.categoryPageName.name;
    return InkWell(
      onTap: () => controller.setScreen(index),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: select ? Colors.grey : Colors.red),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
      ),
    );
  }
}
