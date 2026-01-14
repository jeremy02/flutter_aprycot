import 'package:flutter/material.dart';
import '../../../../../models/menu_items/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onDelete;

  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    const double imageSize = 100.0;
    const double imageOverlap = imageSize / 2.2;

    return SizedBox(
      height: 85,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: imageOverlap,
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: imageOverlap + 16,
                right: 12,
                top: 12,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5EE),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10, right: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cartItem.menuItem.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF07143B),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                '×',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFEA6A12),
                                ),
                              ),
                              Text(
                                '${cartItem.quantity}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF07143B),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: onDelete,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              'images/delete_icon.png',
                              fit: BoxFit.cover,
                              color: Color(0xFFE60A0A),
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 4.0,
                          ),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1A1A2E),
                              ),
                              children: [
                                TextSpan(text: '\$'), // total Price (price × quantity)
                                TextSpan(
                                  text: (cartItem.menuItem.price * cartItem.quantity).toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1A1A2E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: -5,
            child: Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE60A0A),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Image.asset(
                cartItem.menuItem.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}