import 'package:get/get.dart';

import '../models/navigation/data/app_navigation_items.dart';
import '../models/navigation/navigation_item.dart';
import '../models/navigation/sub_menu_item.dart';

class AppNavigationController extends GetxController {
  final showRail = false.obs;
  final RxInt selectedIndex = 0.obs;
  final RxString selectedSubmenuId = 'authentication'.obs;
  final RxBool isExpanded = false.obs;
  final RxSet<String> expandedMenus = <String>{}.obs;
  final RxString currentPage = 'Sign Up'.obs;

  final List<NavigationItem> navigationItems = AppNavigationItems.items;

  // handle back button press, returns true if app should exit
  Future<bool> handleBackButton() async {
    if (selectedSubmenuId.value != 'dashboard') {
      // Switch to dashboard screen
      selectedSubmenuId.value = 'dashboard';
      currentPage.value = 'Dashboard';
      selectedIndex.value = 1; // index of dashboard in your navigationItems
      showRail.value = true;   // ensure sidebar is visible
      return false; // prevent default back action
    }
    return true; // allow exit if already on dashboard
  }

  // Toggle sidebar expansion
  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
    if (!isExpanded.value) expandedMenus.clear();
  }

  void navigateTo(String submenuId, {String? pageName}) {
    // first, try to find a top-level item with this id
    final topItem = navigationItems.firstWhere(
          (item) => item.id == submenuId,
      orElse: () => NavigationItem(id: '', label: ''),
    );

    if (topItem.id.isNotEmpty) {
      // top-level navigation item found
      selectedIndex.value = navigationItems.indexOf(topItem);
      selectedSubmenuId.value = topItem.id;
      currentPage.value = pageName ?? topItem.label;
      showRail.value = topItem.showRail;
      // Clear expanded menus if selecting a non-submenu
      if (!topItem.hasSubmenu) expandedMenus.clear();
      return;
    }

    // if not a top-level, try to find in submenus
    for (var item in navigationItems) {
      if (item.submenuItems != null) {
        final sub = item.submenuItems!.firstWhere(
              (s) => s.id == submenuId,
          orElse: () => SubmenuItem(id: '', label: ''),
        );
        if (sub.id.isNotEmpty) {
          selectedIndex.value = -1;
          selectedSubmenuId.value = sub.id;
          currentPage.value = pageName ?? sub.label;
          showRail.value = true; // usually rail stays visible for submenus
          return;
        }
      }
    }

    // ff still not found, default to dashboard
    selectedIndex.value = 1; // dashboard index
    selectedSubmenuId.value = 'dashboard';
    currentPage.value = 'Dashboard';
    showRail.value = true;
  }

  // Select top-level item
  void selectItem(int index, NavigationItem item) {
    selectedIndex.value = index;
    selectedSubmenuId.value = item.id;
    currentPage.value = item.label;

    // dynamically set showRail based on item property
    showRail.value = item.showRail;

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

    // for now all submenus do not hide the rail
    showRail.value = true;

    // auto-navigate dynamically to route is defined
    Get.toNamed(submenu.id);
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
