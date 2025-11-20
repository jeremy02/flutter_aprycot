import 'package:flutter/material.dart';
import '../../../controllers/app_menu_controller.dart';
import '../../../models/navigation/navigation_item.dart';

class NavItemCollapsed extends StatelessWidget {
  final AppMenuController controller;
  final NavigationItem item;
  final int index;
  final bool selected;

  const NavItemCollapsed({
    super.key,
    required this.controller,
    required this.item,
    required this.index,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFEA6A12);

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        width: selected ? 48 : 40,
        height: selected ? 48 : 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? orange : const Color(0xFFF5F5F5),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: const CircleBorder(),
            splashColor: orange.withOpacity(0.3),
            highlightColor: orange.withOpacity(0.1),
            onTap: () => controller.selectItem(index, item),
            child: Padding(
              padding: EdgeInsets.all(selected ? 12 : 10),
              child: Image.asset(
                item.iconPath!,
                color: selected ? Colors.white : const Color(0xFF959895),
              ),
            ),
          ),
        ),
      ),
    );
  }
}