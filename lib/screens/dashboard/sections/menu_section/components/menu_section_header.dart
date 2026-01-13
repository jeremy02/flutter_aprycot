import 'package:flutter/material.dart';
import 'arrow_icon_button.dart';

class MenuSectionHeader extends StatelessWidget {
  const MenuSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Menu Category',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
              height: 1.2,
              letterSpacing: -0.5,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                        width: 6
                    ),
                    ArrowIconButton(false),
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}

