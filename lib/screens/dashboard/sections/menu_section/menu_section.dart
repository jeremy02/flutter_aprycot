import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/menu_category_controller.dart';
import '../../../../controllers/menu_items_controller.dart';
import 'components/menu_category_card.dart';
import 'components/menu_items_card.dart';
import 'components/menu_section_header.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {

    const double containerHeight = 710.0;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Flexible(
            flex: 63,
            child: Container(
              // height: containerHeight,
              width: double.infinity,
              color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const MenuSectionHeader(),
                  const SizedBox(height: 32),
                  _buildMenuCategorySection(context),
                  const SizedBox(height: 32),
                  _buildMenuItemsSection(context),
                  // const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            flex: 37,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: containerHeight,
                width: double.infinity,
                // color: Colors.yellow,
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 24.0,
                ),
                child: _buildCartSection(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMenuCategorySection(BuildContext context) {
  final MenuCategoryController controller = Get.put(MenuCategoryController());

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 248, maxHeight: 248),
      child: ListView.builder(
        controller: controller.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index < controller.categories.length - 1 ? 24 : 0,
            ),
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

Widget _buildMenuItemsSection(BuildContext context) {
  final MenuItemsController controller = Get.put(MenuItemsController());

  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    child: LayoutBuilder(
      builder: (context, constraints) {
        // here we compute dynamic item width based on available panel width
        controller.computeItemWidth(constraints.maxWidth);

        return ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 300,
            maxHeight: 320,
          ),
          child: ListView.builder(
            controller: controller.scrollController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.menuItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == controller.menuItems.length - 1
                      ? 0
                      : controller.spacing,
                ),
                child: Obx(() => MenuItemsCard(
                  width: controller.itemWidth,
                  item: controller.menuItems[index],
                  isSelected: controller.selectedIndex.value == index,
                  onTap: () => controller.selectItem(index),
                  onAddTap: () => controller.addToCart(index),
                )),
              );
            },
          ),
        );
      },
    ),
  );
}

Widget _buildCartSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'My Cart',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Color(0xFF07143B),
          height: 1.2,
          letterSpacing: -0.5,
        ),
      ),
      const SizedBox(height: 24),
      const Divider(
          height: 1, color: Color(0xFFE3E1E1)
      ),
    ],
  );
}


