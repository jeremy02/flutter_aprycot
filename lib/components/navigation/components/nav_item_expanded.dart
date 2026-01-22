import 'package:flutter/material.dart';

import '../../../controllers/app_navigation_controller.dart';
import '../../../models/navigation/navigation_item.dart';

class NavItemExpanded extends StatelessWidget {
  final AppNavigationController controller;
  final NavigationItem item;
  final int index;
  final bool selected;
  final bool expanded;

  const NavItemExpanded({
    super.key,
    required this.controller,
    required this.item,
    required this.index,
    required this.selected,
    required this.expanded
  });

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFEA6A12);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => controller.selectItem(index, item),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                color: selected ? orange : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    item.iconPath!,
                    width: 24,
                    color: selected ? Colors.white : orange,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item.label,
                      style: TextStyle(
                          color:
                          selected ? Colors.white : Colors.grey.shade700
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (item.hasSubmenu)
                    Icon(
                      expanded ? Icons.keyboard_arrow_down : Icons.chevron_right,
                      color: selected ? Colors.white : Colors.grey.shade600,
                    )
                  else
                    Icon(Icons.chevron_right,
                        size: 20,
                        color: selected
                            ? Colors.white
                            : Colors.grey.shade400)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}