import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final selectedIndex = 0.obs;

  final List<String> categories = [
    'Burgers', 'Pizza', 'Dessert', 'Dessert', 'Biscuits', 'Grilled cheese',
    'Grilled cheese', 'Tomato soup', 'Chicken fingers', 'Chicken', 'nuggets',
    'Flatbread pizza', 'Flatbread pizza', 'Mac & cheese', 'Mini burgers',
    'Mini burgers', 'Mini pizzas', 'Grilled Cheese', 'Grilled',
    'Veggie Grill\'s', 'Sandwich', 'Soup',
  ];

  void selectCategory(int index) {
    selectedIndex.value = index;
  }
}