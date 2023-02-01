import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menu_controller/menu_controller.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuController>();
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.category.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () => controller.setScreen(index),
          child: Container(
            padding: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Text(controller.category[index]),
          ),
        ),
      ),
    );
  }
}
