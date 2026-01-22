import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/app_navigation_controller.dart';
import 'components/navigation.dart';

class NavigationRailWidget extends StatelessWidget {
  final AppNavigationController controller;
  const NavigationRailWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: controller.isExpanded.value ? 250 : 72,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 0))
          ],
        ),
        child: Column(
          children: [
            NavHeader(controller: controller),
            Divider(height: .8, color: Colors.grey.shade300),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: _buildItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItems() {
    List<Widget> items = [];
    int itemIndex = 0;

    for (var i = 0; i < controller.navigationItems.length; i++) {
      final item = controller.navigationItems[i];

      if (item.isHeader) {
        items.add(NavSectionHeader(controller: controller, label: item.label));
      } else {
        items.add(NavItem(
          controller: controller,
          item: item,
          index: itemIndex,
        ));

        itemIndex++;

        final nextIsHeader =
            i + 1 < controller.navigationItems.length &&
                controller.navigationItems[i + 1].isHeader;

        if (nextIsHeader || i == controller.navigationItems.length - 1) {
          if (controller.isExpanded.value) {
            items.add(Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Divider(height: .8, color: Colors.grey.shade300),
            ));
          }
        }
      }
    }

    return items;
  }
}
