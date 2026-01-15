import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/dashboard/section_header.dart';
import '../../../../controllers/menu_category_controller.dart';
import '../../../../controllers/menu_items_controller.dart';
import 'components/cart_section.dart';
import 'components/menu_category_card.dart';
import 'components/menu_items_card.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    const double containerHeight = 686.0;

    // initialize controllers
    final MenuCategoryController categoryController = Get.put(MenuCategoryController());
    final MenuItemsController itemsController = Get.put(MenuItemsController());

    return Row(
      children: [
        Flexible(
          flex: 63,
          child: SizedBox(
            height: containerHeight,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                SectionHeader(
                  sectionHeaderTitle: 'Menu Category',
                  sectionHeaderFontSize: 32,
                  sectionHeaderPadding: const EdgeInsets.fromLTRB(36, 8, 16, 8),
                  onClickViewAll: () => print('View all menu categories'),
                ),
                const SizedBox(height: 32),
                _MenuCategorySection(controller: categoryController),
                // const SizedBox(height: 32),
                const Spacer(),
                _MenuItemsSection(controller: itemsController),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
            flex: 37,
            child: CartSection(containerHeight: containerHeight, controller: itemsController)
        ),
      ],
    );
  }
}

/// Menu Categories Horizontal List
class _MenuCategorySection extends StatelessWidget {
  final MenuCategoryController controller;

  const _MenuCategorySection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 36, right: 16
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 248, maxHeight: 248),
        child: ListView.builder(
          controller: controller.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) {
            // Wrap only the card in Obx
            return Padding(
              padding: EdgeInsets.only(right: index < controller.categories.length - 1 ? 24 : 0),
              child: Obx(() {
                final isSelected = controller.selectedIndex.value == index;
                return MenuCategoryCard(
                  category: controller.categories[index],
                  isSelected: isSelected,
                  onTap: () => controller.selectCategory(index, context),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

/// Menu Items Horizontal List
class _MenuItemsSection extends StatelessWidget {
  final MenuItemsController controller;

  const _MenuItemsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          controller.computeItemWidth(constraints.maxWidth);

          return ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 300, maxHeight: 320),
            child: ListView.builder(
              controller: controller.scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.menuItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: index == controller.menuItems.length - 1 ? 0 : controller.spacing),
                  child: Obx(() {
                    // Wrap only the item card in Obx
                    return MenuItemsCard(
                      width: controller.itemWidth,
                      item: controller.menuItems[index],
                      isSelected: controller.selectedIndex.value == index,
                      onTap: () => controller.selectItem(index),
                      onAddTap: () => controller.addToCart(index),
                    );
                  }),
                );
              },
            ),
          );
        },
      ),
    );
  }
}