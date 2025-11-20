import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/app_menu_controller.dart';
import '../../../models/navigation/navigation_item.dart';
import 'nav_item_expanded.dart';
import 'nav_item_collapsed.dart';
import 'nav_submenu_item.dart';

class NavItem extends StatefulWidget {
  final AppMenuController controller;
  final NavigationItem item;
  final int index;

  const NavItem({
    super.key,
    required this.controller,
    required this.item,
    required this.index,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _submenuController;
  late final Animation<double> _submenuAnimation;

  @override
  void initState() {
    super.initState();
    _submenuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _submenuAnimation = CurvedAnimation(
      parent: _submenuController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _submenuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selected = widget.controller.isItemSelected(widget.index, widget.item);
      final expanded = widget.controller.expandedMenus.contains(widget.item.id);

      // Animate submenu
      if (widget.item.hasSubmenu) {
        if (expanded) {
          _submenuController.forward();
        } else {
          _submenuController.reverse();
        }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main nav item
          widget.controller.isExpanded.value
              ?
          NavItemExpanded(
            controller: widget.controller,
            item: widget.item,
            index: widget.index,
            selected: selected,
            expanded: expanded,

          )
              :
          NavItemCollapsed(
            controller: widget.controller,
            item: widget.item,
            index: widget.index,
            selected: selected,
          ),

          // animate the submenu block
          if (widget.item.hasSubmenu && widget.controller.isExpanded.value)
            SizeTransition(
              sizeFactor: _submenuAnimation,
              axisAlignment: -1.0,
              child: Column(
                children: widget.item.submenuItems!
                    .map((sub) => NavSubmenuItem(
                  controller: widget.controller,
                  submenu: sub,
                ))
                    .toList(),
              ),
            ),
        ],
      );
    });
  }
}
