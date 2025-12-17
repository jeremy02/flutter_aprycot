import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/controllers/menu_category_controller.dart';
import 'package:get/get.dart';

import 'components/category_card.dart';

class MenuSection extends StatelessWidget {
  MenuSection({super.key});

  final MenuCategoryController controller = Get.put(MenuCategoryController());

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
                _Header(),
                const SizedBox(height: 32),
                SizedBox(
                  height: 240,
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

                          return CategoryCard(
                            category: controller.categories[index],
                            isSelected: isSelected,
                            onTap: () =>
                                controller.selectCategory(index, context),
                          );
                        }),
                      );
                    },
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

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Menu Category',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
            letterSpacing: -0.5,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFEA6A12),
            foregroundColor: Colors.white,
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: const Row(
            children: [
              Text(
                'View All',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 6),
              Icon(Icons.arrow_forward, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}

