import 'package:flutter/material.dart';

import 'arrow_icon_button.dart';

class SectionHeader extends StatelessWidget {
  final String sectionHeaderTitle;
  final double sectionHeaderFontSize;
  final EdgeInsets sectionHeaderPadding;
  final VoidCallback? onClickViewAll;

  const SectionHeader({
    super.key,
    required this.sectionHeaderTitle,
    required this.sectionHeaderFontSize,
    required this.sectionHeaderPadding,
    required this.onClickViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: sectionHeaderPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            sectionHeaderTitle,
            style: TextStyle(
              fontSize: sectionHeaderFontSize,
              fontWeight: FontWeight.w700,
              color: Color(0xFF07143B),
              height: 1.2,
              letterSpacing: -0.5,
            ),
          ),
          // Only show button if callback is not null
          if (onClickViewAll != null)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onClickViewAll,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(width: 6),
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

