import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/app_navigation_controller.dart';

class NavSectionHeader extends StatelessWidget {
  final AppNavigationController controller;
  final String label;

  const NavSectionHeader(
      {super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isExpanded.value) return const SizedBox.shrink();

      return Padding(
        padding: const EdgeInsets.fromLTRB(
            24, 12, 8, 12
        ),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
              letterSpacing: .5),
        ),
      );
    });
  }
}
