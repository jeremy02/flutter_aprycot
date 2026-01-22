import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu_items/cart_item.dart';
import '../models/menu_items/data/menu_items.dart';
import '../models/menu_items/menu_item.dart';
import '../utils/responsive_grid_calculator.dart';

class MenuItemsController extends GetxController {
  final selectedIndex = 1.obs;
  final trendingItemsSelectedIndex = 2.obs;
  final cartItems = <CartItem>[].obs;
  final canCheckout = false.obs;
  final totalPrice = 0.0.obs;

  final ScrollController scrollController = ScrollController();

  List<MenuItem> get menuItems => MenuItems.items;
  List<MenuItem> get trendingOrderItems => MenuItems.trendingOrderItems;

  // handle dynamic width and spacing
  double _itemWidth = 200;
  double _spacing = 20;

  double get itemWidth => _itemWidth;
  double get spacing => _spacing;

  @override
  void onInit() {
    super.onInit();

    // update canCheckout & totalPrice whenever cart changes
    ever(cartItems, (_) => _updateCartState());

    scrollController.addListener(_onScrollEnd);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // compute dynamic item width based on panel width
  void computeItemWidth(double panelWidth) {
    const minItemWidth = 190.0;

    double visibleItems;
    if ((panelWidth / minItemWidth) < 4.3) {
      visibleItems = 3.3;
    } else {
      visibleItems = 4.3;
    }

    // final double spacing = visibleItems == 3.3 ? 24.0 : 20.0;
    final double spacing = visibleItems == 3.3 ? 20.0 : 20.0;

    _itemWidth = (panelWidth - spacing * (visibleItems - 1)) / visibleItems;
    _spacing = spacing;
  }

  // handle selection & scroll snapping for menu items
  void selectItem(int index) {
    selectedIndex.value = index;
    _scrollToIndex(index);
  }

  // handle selection & scroll snapping for trending order items
  void selectTrendingOrderItem(int index) {
    trendingItemsSelectedIndex.value = index;
    // _scrollToIndex(index);
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

  // cart management
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

  void deleteFromCart(int cartIndex) {
    if (cartIndex >= 0 && cartIndex < cartItems.length) {
      cartItems.removeAt(cartIndex);
    }
  }

  // update reactive cart state
  void _updateCartState() {
    // Can checkout if cart has at least 1 item with quantity > 0
    canCheckout.value =
        cartItems.isNotEmpty && cartItems.any((item) => item.quantity > 0);

    // Compute total price
    totalPrice.value =
        cartItems.fold(0, (sum, item) => sum + (item.menuItem.price * item.quantity));
  }

  // get the responsive grid calculator
  ResponsiveGridCalculator gridCalculator(double containerWidth) {
    return ResponsiveGridCalculator(containerWidth: containerWidth);
  }
}
