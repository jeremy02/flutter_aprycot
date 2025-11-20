import '../navigation_item.dart';
import '../sub_menu_item.dart';

class AppNavigationItems {
  static final List<NavigationItem> items = [
    NavigationItem(
      id: 'home',
      iconPath: 'images/nav_menu/ic_special_pages.png',
      label: 'Home',
      isHeader: true,
    ),
    NavigationItem(
      id: 'dashboard',
      iconPath: 'images/nav_menu/ic_special_pages.png',
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
      iconPath: 'images/nav_menu/ic_special_pages.png',
      label: 'Authentication',
      isHeader: false,
      hasSubmenu: false,
    ),
    NavigationItem(
      id: 'users',
      iconPath: 'images/nav_menu/ic_special_pages.png',
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
      iconPath: 'images/nav_menu/ic_special_pages.png',
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
      iconPath: 'images/nav_menu/ic_special_pages.png',
      label: 'Components',
      isHeader: false,
      hasSubmenu: false,
    ),
    NavigationItem(
      id: 'widgets',
      iconPath: 'images/nav_menu/ic_special_pages.png',
      label: 'Widgets',
      isHeader: false,
      hasSubmenu: false,
    ),
  ];
}
