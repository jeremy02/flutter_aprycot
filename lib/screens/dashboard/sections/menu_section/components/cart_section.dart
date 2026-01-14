import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/menu_items_controller.dart';
import 'empty_cart.dart';

class CartSection extends StatelessWidget {
  final double containerHeight;
  final MenuItemsController controller;

  const CartSection({super.key, required this.containerHeight, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: containerHeight,
          color: Colors.white,
          padding: const EdgeInsets.all(24),
          child: Column(
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
              const Divider(height: 1, color: Color(0xFFE3E1E1)),
              const SizedBox(height: 24),
              Expanded(
                child: EmptyCart(),
                // Container(
                //   width: double.infinity,
                //   height: double.infinity,
                //   color: Colors.blue,
                // ),
              ),
              const SizedBox(height: 16),
              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: controller.canCheckout.value ? () {
                        print('Checkout: ${controller.totalPrice.toStringAsFixed(2)}');
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEA6A12),
                        foregroundColor: Colors.white,
                        // disabledBackgroundColor: const Color(0xFFE0E0E0),
                        // disabledForegroundColor: Colors.white,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),
                  ),
                );
              },),
              // const SizedBox(height: 24), TODO - Check if we can remove this entirely
            ],
          ),
        ),
      ),
    );
  }
}
