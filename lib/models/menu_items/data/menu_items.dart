import '../menu_item.dart';

class MenuItems {
  // initialize the menu items here
  static final List<MenuItem> items = [
    MenuItem(
      name: 'Spaghetti',
      price: 7.29,
      rating: 3.0,
      imagePath: 'images/menu_items/menu_item_spaghetti.png',
    ),
    MenuItem(
      name: 'Vegetable Pizza',
      price: 5.49,
      rating: 1.5,
      imagePath: 'images/menu_items/menu_item_vegetable_pizza.png',
    ),
    MenuItem(
      name: 'Mushroom Pizza',
      price: 7.49,
      originalPrice: 8.49,
      rating: 4.5,
      imagePath: 'images/menu_items/menu_item_mushroom_pizza.png',
    ),
    MenuItem(
      name: 'Sweets',
      price: 6.49,
      rating: 2.5,
      imagePath: 'images/menu_items/menu_item_sweets.png',
    ),
    MenuItem(
      name: 'Sausage Pizza',
      price: 8.49,
      rating: 3.5,
      imagePath: 'images/cart_items/cart_item_sausage_pizza.png',
    ),
    MenuItem(
      name: 'Cheese Pizza',
      price: 5.29,
      rating: 1.5,
      imagePath: 'images/cart_items/cart_item_cheese_pizza.png',
    ),
  ];

  // initialize the trending orders here
  static final List<MenuItem> trendingOrderItems = [
    MenuItem(
      name: 'Italian Salad',
      price: 7.49,
      rating: 4,
      calories: 100,
      persons: 4,
      badge: 'Top of the week',
      imagePath: 'images/trending_items/trending_image_italian_salad_1.png',
    ),
    MenuItem(
      name: 'Italian Salad',
      price: 7.49,
      rating: 4,
      calories: 50,
      persons: 4,
      badge: 'Top of the day',
      imagePath: 'images/trending_items/trending_image_italian_salad_2.png',
    ),
    MenuItem(
      name: 'Italian Salad',
      price: 7.49,
      rating: 3,
      calories: 90,
      persons: 3,
      badge: 'Top of the month',
      imagePath: 'images/trending_items/trending_image_italian_salad_3.png',
    ),
    MenuItem(
      name: 'Italian Salad',
      price: 7.49,
      rating: 4.5,
      calories: 50,
      persons: 5,
      badge: 'Top of the week',
      imagePath: 'images/trending_items/trending_image_italian_salad_4.png',
    ),
    MenuItem(
      name: 'Italian Salad',
      price: 7.49,
      rating: 2.5,
      calories: 70,
      persons: 6,
      badge: 'Top of the month',
      imagePath: 'images/trending_items/trending_image_italian_salad_5.png',
    ),
    MenuItem(
      name: 'Italian Salad',
      price: 7.49,
      rating: 1.5,
      calories: 80,
      persons: 4,
      badge: 'Top of the day',
      imagePath: 'images/trending_items/trending_image_italian_salad_6.png',
    ),
  ];
}