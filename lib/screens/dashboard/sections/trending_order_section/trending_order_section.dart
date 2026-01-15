import 'package:flutter/material.dart';
import '../../../../components/dashboard/section_header.dart';

class TrendingOrderSection extends StatelessWidget {
  const TrendingOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    const double containerHeight = 686.0;

    return Row(
      children: [
        Flexible(
          flex: 63,
          child: SizedBox(
            height: containerHeight,
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