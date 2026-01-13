import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu_items/cart_item.dart';
import '../models/menu_items/data/menu_items.dart';
import '../models/menu_items/menu_item.dart';

class MenuItemsController extends GetxController {
  final selectedIndex = 0.obs;
  final cartItems = <CartItem>[].obs;
  final ScrollController scrollController = ScrollController();

  List<MenuItem> get menuItems => MenuItems.items;

  // dynamic width / spacing for the menu items
  double _itemWidth = 200;
  double _spacing = 16;

  double get itemWidth => _itemWidth;
  double get spacing => _spacing;

  // compute item width based on available panel width
  void computeItemWidth(double panelWidth) {
    const minItemWidth = 190.0;
    const spacing = 16.0;

    double visibleItems;
    if ((panelWidth / minItemWidth) < 4.3) {
      visibleItems = 3.3; // items to show for a smaller panel
    } else {
      visibleItems = 4.3; // items to show for a larger panel
    }

    _itemWidth = (panelWidth - spacing * (visibleItems - 1)) / visibleItems;
    _spacing = spacing;
  }

  @override
  void onInit() {
    super.onInit();
    addToCart(0);
    addToCart(2);
    addToCart(2);
    addToCart(3);

    scrollController.addListener(_onScrollEnd);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // select item and snap to center
  void selectItem(int index) {
    selectedIndex.value = index;
    _scrollToIndex(index);
  }

  void _scrollToIndex(int index) {
    if (!scrollController.hasClients) return;

    final viewportWidth = scrollController.position.viewportDimension;

    final targetOffset =
        index * (_itemWidth + _spacing) - (viewportWidth - _itemWidth) / 2;

    scrollController.animateTo(
      targetOffset.clamp(
        scrollController.position.minScrollExtent,
        scrollController.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _onScrollEnd() {
    if (!scrollController.position.isScrollingNotifier.value) {
      _snapToClosestItem();
    }
  }

  void _snapToClosestItem() {
    final offset = scrollController.offset;
    final index = (offset / (_itemWidth + _spacing)).round();
    selectItem(index);
  }

  // Cart methods / functionalities
  void addToCart(int index) {
    final item = menuItems[index];
    final existingIndex =
    cartItems.indexWhere((cartItem) => cartItem.menuItem.name == item.name);

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(menuItem: item));
    }
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
}
