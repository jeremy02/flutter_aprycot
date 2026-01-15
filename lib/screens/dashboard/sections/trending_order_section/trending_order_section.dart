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
            const spacing = 20.0;
            const imageOverhang = 50.0;
            const minCardContentWidth = 220.0;
            const baseCardHeight = 220.0;

            const totalCardWidth = minCardContentWidth + imageOverhang + 10;

            int crossAxisCount;
            int itemCount;

            if (constraints.maxWidth >= (totalCardWidth * 3 + spacing * 2)) {
              crossAxisCount = 3;
              itemCount = 6;
            } else {
              crossAxisCount = 2;
              itemCount = 6;
            }

            final totalSpacing = spacing * (crossAxisCount - 1);
            final availableWidth = constraints.maxWidth - totalSpacing;
            final cardWidth = availableWidth / crossAxisCount;

            // 🔑 dynamic height
            double cardHeight = baseCardHeight;
            if (cardWidth < 260) cardHeight += 16;
            if (cardWidth < 220) cardHeight += 24;

            final childAspectRatio = (cardWidth / cardHeight)  + (crossAxisCount == 3 ? 0.09 : 0.10);
            // final childAspectRatio = (cardWidth / cardHeight);

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Obx(() => TrendingOrderCard(
                  trendingOrder: controller.trendingOrderItems[index],
                  isSelected: controller.trendingItemsSelectedIndex.value == index,
                  onTap: () => controller.selectTrendingOrderItem(index),
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