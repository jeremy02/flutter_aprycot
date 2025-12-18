import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/controllers/menu_category_controller.dart';
import 'package:get/get.dart';

import 'components/category_card.dart';
import 'components/menu_section_header.dart';

class MenuSection extends StatelessWidget {
  MenuSection({super.key});

  final MenuCategoryController menuCategoryController = Get.put(MenuCategoryController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Flexible(
            flex: 63,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuSectionHeader(),
                const SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 248,
                      maxHeight: 248,
                    ),
                    child: ListView.builder(
                      controller: menuCategoryController.scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: menuCategoryController.categories.length,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: index < menuCategoryController.categories.length - 1 ? 24 : 0,
                          ),
                          child: Obx(() {
                            final isSelected = menuCategoryController.selectedIndex.value == index;

                            return CategoryCard(
                              category: menuCategoryController.categories[index],
                              isSelected: isSelected,
                              onTap: () =>
                                  menuCategoryController.selectCategory(index, context),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            flex: 37,
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
