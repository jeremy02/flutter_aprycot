import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/dashboard/section_header.dart';
import '../../../../controllers/menu_items_controller.dart';
import 'components/trending_order_card.dart';

class TrendingOrderSection extends StatelessWidget {
  const TrendingOrderSection({super.key});

  @override
  Widget build(BuildContext context) {

    // initialize controllers
    final MenuItemsController trendingItemsController = Get.put(MenuItemsController());

    const double containerHeight = 686.0;

    return Row(
      children: [
        Flexible(
          flex: 63,
          child: SizedBox(
            // height: containerHeight,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                SectionHeader(
                  sectionHeaderTitle: 'Trending Orders',
                  sectionHeaderFontSize: 32,
                  sectionHeaderPadding: const EdgeInsets.fromLTRB(36, 8, 16, 8),
                  onClickViewAll: () => print('View all trending orders'),
                ),
                const SizedBox(height: 32),
                _TrendingOrdersListSection(controller: trendingItemsController),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 37,
          child: Container(
            width: double.infinity,
            height: containerHeight,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}

/// Trending Orders List
class _TrendingOrdersListSection extends StatelessWidget {
  final MenuItemsController controller;

  const _TrendingOrdersListSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 400,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final gridCalculator = controller.gridCalculator(constraints.maxWidth);
            final crossAxisCount = gridCalculator.getCrossAxisCount();
            final itemCount = gridCalculator.getItemCount();
            final childAspectRatio = gridCalculator.getChildAspectRatio();

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: gridCalculator.getSpacing,
                mainAxisSpacing: gridCalculator.getSpacing,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Obx(() => TrendingOrderCard(
                  trendingOrder: controller.trendingOrderItems[index],
                  isSelected: controller.selectedIndex.value == index,
                  onTap: () => controller.selectItem(index),
                  onAddTap: () => controller.addToCart(index),
                ));
              },
            );
          },
        ),
      ),
    );
  }
}