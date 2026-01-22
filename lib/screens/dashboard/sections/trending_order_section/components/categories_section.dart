import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/dashboard/section_header.dart';
import '../../../../../controllers/categories_controller.dart';

class CategoriesSection extends StatelessWidget {
  final CategoriesController controller;

  const CategoriesSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20.0
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SectionHeader(
                  sectionHeaderTitle: 'Categories',
                  sectionHeaderFontSize: 20,
                  sectionHeaderPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                  onClickViewAll: () => print('View all categories'),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: const Divider(height: 1, color: Color(0xFFE3E1E1),),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Obx(() => Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(controller.categories.length, (index) {
                      final isSelected = controller.selectedIndex.value == index;

                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () => controller.selectCategory(index),
                          splashColor: const Color(0xFFEA6A12).withOpacity(0.2),
                          highlightColor: const Color(0xFFEA6A12).withOpacity(0.1),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFFEA6A12) : Colors.white,
                              border: Border.all(color: const Color(0xFFEA6A12), width: 1.5),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              controller.categories[index],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : const Color(0xFFEA6A12),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
