import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu_items/cart_item.dart';
import '../models/menu_items/data/menu_items.dart';
import '../models/menu_items/menu_item.dart';

class MenuItemsController extends GetxController {
  final selectedIndex = 2.obs;
  final cartItems = <CartItem>[].obs;

  List<MenuItem> get menuItems => MenuItems.items;

  final ScrollController scrollController = ScrollController();

  static const double _itemWidth = 200;
  static const double _itemSpacing = 16;

  @override
  void onInit() {
    super.onInit();
    // Add default items to cart
    addToCart(0); // Spaghetti
    addToCart(2); // Mushroom Pizza
    addToCart(2); // Mushroom Pizza again
    addToCart(3); // Sweets
  }

  void selectItem(int index, BuildContext context) {
    selectedIndex.value = index;
    _scrollToIndex(index, context);
  }

  void addToCart(int index) {
    final item = menuItems[index];

    // Check if item already exists in cart
    final existingItemIndex = cartItems.indexWhere(
          (cartItem) => cartItem.menuItem.name == item.name,
    );

    if (existingItemIndex != -1) {
      // Increase quantity
      cartItems[existingItemIndex].quantity++;
      cartItems.refresh();
    } else {
      // Add new item
      cartItems.add(CartItem(menuItem: item));
    }

    // print('Added ${item.name} to cart');
  }

  void removeFromCart(int cartIndex) {
    if (cartIndex >= 0 && cartIndex < cartItems.length) {
      if (cartItems[cartIndex].quantity > 1) {
        cartItems[cartIndex].quantity--;
        cartItems.refresh();
      } else {
        cartItems.removeAt(cartIndex);
      }
    }
  }

  void deleteFromCart(int cartIndex) {
    if (cartIndex >= 0 && cartIndex < cartItems.length) {
      cartItems.removeAt(cartIndex);
    }
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.menuItem.price * item.quantity));
  }

  void _scrollToIndex(int index, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final offset = index * (_itemWidth + _itemSpacing) -
        (screenWidth / 2 - _itemWidth / 2);

    if (!scrollController.hasClients) return;

    scrollController.animateTo(
      offset.clamp(
        scrollController.position.minScrollExtent,
        scrollController.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}