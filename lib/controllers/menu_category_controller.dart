import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu_category/data/menu_category_items.dart';
import '../models/menu_category/menu_category_item.dart';

class MenuCategoryController extends GetxController {
  final selectedIndex = 0.obs;

  List<MenuCategoryItem> get categories => MenuCategoryItems.items;

  final ScrollController scrollController = ScrollController();

  static const double _itemWidth = 140;
  static const double _itemSpacing = 16;

  void selectCategory(int index, BuildContext context) {
    selectedIndex.value = index;
    _scrollToIndex(index, context);
  }

  void _scrollToIndex(int index, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.63;

    final offset =
        index * (_itemWidth + _itemSpacing) -
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
