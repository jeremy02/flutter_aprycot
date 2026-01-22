import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/dashboard/section_header.dart';
import '../../../../../components/primary_button.dart';
import '../../../../../controllers/menu_items_controller.dart';
import 'cart_item_card.dart';
import 'empty_cart.dart';

class CartSection extends StatelessWidget {
  final double containerHeight;
  final MenuItemsController controller;

  const CartSection({super.key, required this.containerHeight, required this.controller});

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
            height: containerHeight,
            color: Colors.white,
            // padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                SectionHeader(
                  sectionHeaderTitle: 'My Cart',
                  sectionHeaderFontSize: 20,
                  sectionHeaderPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                  onClickViewAll: null,
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: const Divider(height: 1, color: Color(0xFFE3E1E1),),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Obx(() {
                    if (controller.cartItems.isEmpty) {
                      return EmptyCart();
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cartItems.length,
                      itemBuilder: (context, index) {
                        final isFirst = index == 0;
                        final isLast = index == controller.cartItems.length - 1;

                        return Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: isFirst ? 24 : 0,
                            bottom: isLast ? 24 : 45,
                          ),
                          child: CartItemCard(
                            cartItem: controller.cartItems[index],
                            onDelete: () => controller.deleteFromCart(index),
                          ),
                        );
                      },
                    );
                  },),
                ),
                const SizedBox(height: 16),
                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: PrimaryButton(
                        label: 'Checkout',
                        onPressed: controller.canCheckout.value ? () {
                          print('Checkout: ${controller.totalPrice.toStringAsFixed(2)}');
                        } : null,
                      ),
                    ),
                  );
                },),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
