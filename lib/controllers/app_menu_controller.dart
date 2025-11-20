import 'package:get/get.dart';
import '../models/navigation/navigation_item.dart';
import '../models/navigation/sub_menu_item.dart';
import '../models/navigation/data/app_navigation_items.dart';

class AppMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final RxString selectedSubmenuId = ''.obs;
  final RxBool isExpanded = false.obs;
  final RxSet<String> expandedMenus = <String>{}.obs;
  final RxString currentPage = 'Dashboard'.obs;

  final List<NavigationItem> navigationItems = AppNavigationItems.items;

  // Toggle sidebar expansion
  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
    if (!isExpanded.value) expandedMenus.clear();
  }

  // Select top-level item
  void selectItem(int index, NavigationItem item) {
    selectedIndex.value = index;
    selectedSubmenuId.value = '';
    currentPage.value = item.label;

    if (item.hasSubmenu) {
      if (expandedMenus.contains(item.id)) {
        expandedMenus.remove(item.id);
      } else {
        // Auto-close siblings
        final parentIds = navigationItems
            .where((i) => i.hasSubmenu)
            .map((i) => i.id)
            .toList();
        expandedMenus.removeAll(parentIds);
        expandedMenus.add(item.id);
      }
    } else {
      // Close all expanded menus if selecting non-submenu item
      expandedMenus.clear();
    }
  }

  // Select submenu
  void selectSubmenu(SubmenuItem submenu) {
    selectedIndex.value = -1;
    selectedSubmenuId.value = submenu.id;
    currentPage.value = submenu.label;
  }

  // Check if top-level item is selected
  bool isItemSelected(int index, NavigationItem item) {
    return selectedIndex.value == index ||
        (selectedSubmenuId.value.isNotEmpty &&
            item.submenuItems?.any((s) => s.id == selectedSubmenuId.value) ==
                true);
  }

  // Check if submenu is selected
  bool isSubmenuSelected(SubmenuItem submenu) {
    return selectedSubmenuId.value == submenu.id;
  }
}
