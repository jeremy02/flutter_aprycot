import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/app_menu_controller.dart';
import '../../../models/navigation/sub_menu_item.dart';

class NavSubmenuItem extends StatelessWidget {
  final AppMenuController controller;
  final SubmenuItem submenu;

  const NavSubmenuItem({super.key, required this.controller, required this.submenu});

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFEA6A12);

    return Obx(() {
      final selected = controller.isSubmenuSelected(submenu);

      return AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        child: InkWell(
          onTap: () => controller.selectSubmenu(submenu),
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 12, top: 2, bottom: 2),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                color: selected ? orange : Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: selected ? Colors.white : orange,
                      shape: BoxShape.circle),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    submenu.label,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                        color: selected ? Colors.white : Colors.grey.shade700),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
