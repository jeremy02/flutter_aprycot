import '../menu_item.dart';

class MenuItems {
  static final List<MenuItem> items = [
    MenuItem(
      name: 'Spaghetti',
      price: 7.29,
      rating: 3.0,
      imagePath: 'images/menu/menu_spaghetti.png',
    ),
    MenuItem(
      name: 'Vegetable Pizza',
      price: 5.49,
      rating: 3.5,
      imagePath: 'images/menu/menu_vegetable_pizza.png',
    ),
    MenuItem(
      name: 'Mushroom Pizza',
      price: 7.49,
      originalPrice: 8.49,
      rating: 4.5,
      imagePath: 'images/menu/menu_mushroom_pizza.png',
    ),
    MenuItem(
      name: 'Sweets',
      price: 6.49,
      rating: 2.5,
      imagePath: 'images/menu/menu_sweets.png',
    ),
  ];
}