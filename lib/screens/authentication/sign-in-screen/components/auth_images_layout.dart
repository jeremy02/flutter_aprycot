import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../models/auth/auth_image_item.dart';
import 'auth_circle_image.dart';
import 'auth_dashed_circle_painter.dart';

class AuthImagesLayout extends StatelessWidget {
  final List<AuthImageItem> items;

  const AuthImagesLayout({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 60,
        bottom: 20,
      ),
      child: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          // Circle takes 70% of smaller dimension
          final circleDiameter = math.min(width, height) * 0.7;
          final circleRadius = circleDiameter / 2;
          final center = Offset(width / 2, height / 2);

          return Stack(
            children: [
              _buildAuthDashedCirclePainter(center, circleRadius), // the dashed circle
              _buildAuthCircleImageItems(items, center,  circleRadius, width, // the image items
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildAuthDashedCirclePainter(Offset center, double circleRadius) {
    final diameter = circleRadius * 2;

    return Positioned(
      left: center.dx - circleRadius,
      top: center.dy - circleRadius,
      child: CustomPaint(
        size: Size(diameter, diameter),
        painter: AuthDashedCirclePainter(),
      ),
    );
  }

  Widget _buildAuthCircleImageItems(List<AuthImageItem> items, Offset center, double circleRadius, double containerWidth) {
    return Stack(
      children: items.map((item) {
        final itemSize = containerWidth * item.sizeFactor;
        final half = itemSize / 2;

        double x, y;
        if (item.minutePosition == 0) {
          x = center.dx - half;
          y = center.dy - half;
        } else {
          final angle = ((item.minutePosition / 60) * 360 - 90) * math.pi / 180;
          x = center.dx + circleRadius * math.cos(angle) - half;
          y = center.dy + circleRadius * math.sin(angle) - half;
        }

        return Positioned(
          left: x,
          top: y,
          child: AuthCircleImage(
            imageItem: item,
            size: itemSize,
          ),
        );
      }).toList(),
    );
  }
}
