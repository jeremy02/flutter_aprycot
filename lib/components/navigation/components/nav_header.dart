import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/app_menu_controller.dart';

class NavHeader extends StatelessWidget {
  final AppMenuController controller;
  const NavHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Obx(
              () => controller.isExpanded.value
              ? Image.asset('images/nav_menu/aprycot_expanded.png',
              height: 40, fit: BoxFit.contain)
              : Image.asset('images/nav_menu/aprycot.png',
              height: 40, width: 40, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
