import '../navigation_item.dart';
import '../sub_menu_item.dart';

class AppNavigationItems {
  static final List<NavigationItem> items = [
    NavigationItem(
      id: 'home',
      label: 'Home',
      isHeader: true,
    ),
    NavigationItem(
      id: 'dashboard',
      iconPath: 'images/nav_menu/ic_dashboard.png',
      label: 'Dashboard',
      isHeader: false,
    ),
    NavigationItem(
      id: 'pages_header',
      label: 'Pages',
      isHeader: true,
    ),
    NavigationItem(
      id: 'special_pages',
      iconPath: 'images/nav_menu/ic_special_pages.png',
      label: 'Special Pages',
      isHeader: false,
      hasSubmenu: false,
    ),
    NavigationItem(
      id: 'authentication',
      iconPath: 'images/nav_menu/ic_authentication.png',
      label: 'Authentication',
      isHeader: false,
      showRail: false,
      hasSubmenu: false,
    ),
    NavigationItem(
      id: 'users',
      iconPath: 'images/nav_menu/ic_users.png',
      label: 'Users',
      isHeader: false,
      hasSubmenu: true,
      submenuItems: [
        SubmenuItem(id: 'user_profile', label: 'User Profile'),
        SubmenuItem(id: 'edit_user', label: 'Edit User'),
        SubmenuItem(id: 'user_list', label: 'User List'),
      ],
    ),
    NavigationItem(
      id: 'utilities',
      iconPath: 'images/nav_menu/ic_utilities.png',
      label: 'Utilities',
      isHeader: false,
      hasSubmenu: false,
    ),
    NavigationItem(
      id: 'elements_header',
      label: 'Elements',
      isHeader: true,
    ),
    NavigationItem(
      id: 'components',
      iconPath: 'images/nav_menu/ic_components.png',
      label: 'Components',
      isHeader: false,
      hasSubmenu: false,
    ),
    NavigationItem(
      id: 'widgets',
      iconPath: 'images/nav_menu/ic_widgets.png',
      label: 'Widgets',
      isHeader: false,
      hasSubmenu: false,
    ),
  ];
}
