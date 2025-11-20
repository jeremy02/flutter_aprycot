import 'package:flutter_sidebar_x/models/navigation/sub_menu_item.dart';

class NavigationItem {
  final String id;
  final String? iconPath;
  final String label;
  final bool isHeader;
  final bool hasSubmenu;
  final List<SubmenuItem>? submenuItems;

  NavigationItem({
    required this.id,
    this.iconPath,
    required this.label,
    this.isHeader = false,
    this.hasSubmenu = false,
    this.submenuItems,
  });
}