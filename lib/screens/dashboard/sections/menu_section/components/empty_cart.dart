import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {

  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // width: 180, // TODO - Check if we can remove this entirely
            height: 180,
            child: Image.asset(
              'images/error_pages/burger_404.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF07143B),
              ),
              children: [
                const TextSpan(text: 'Your Cart is '),
                TextSpan(
                  text: 'Empty',
                  style: const TextStyle(
                    color: Color(0xFFEA6A12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Must add items on the cart before you proceed to checkout.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF07143B),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

