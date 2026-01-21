import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../models/auth/auth_image_item.dart';

class AuthImagesLayout extends StatelessWidget {
  final List<AuthImageItem> items;

  const AuthImagesLayout({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;

      // Circle takes 70% of smaller dimension
      final circleDiameter = math.min(width, height) * 0.7;
      final circleRadius = circleDiameter / 2;
      final center = Offset(width / 2, height / 2);

      return Stack(
        children: [
          // Dashed circle
          Positioned(
            left: center.dx - circleRadius,
            top: center.dy - circleRadius,
            child: CustomPaint(
              size: Size(circleDiameter, circleDiameter),
              painter: DashedCirclePainter(),
            ),
          ),

          // Image items
          ...items.asMap().entries.map((entry) {
            final item = entry.value;
            final itemSize = width * item.sizeFactor; // strictly width-based
            final half = itemSize / 2;

            double x, y;
            if (item.minutePosition == 0) {
              x = center.dx - half;
              y = center.dy - half;
            } else {
              final angle =
                  ((item.minutePosition / 60) * 360 - 90) * math.pi / 180;
              x = center.dx + circleRadius * math.cos(angle) - half;
              y = center.dy + circleRadius * math.sin(angle) - half;
            }

            return Positioned(
              left: x,
              top: y,
              child: _FoodCircle(
                imagePath: item.imagePath,
                size: itemSize,
                showImage: item.showImage.value,
              ),
            );
          }).toList(),
        ],
      );
    });
  }
}

class _FoodCircle extends StatelessWidget {
  final String imagePath;
  final double size;
  final bool showImage;

  const _FoodCircle({
    required this.imagePath,
    required this.size,
    required this.showImage,
  });

  @override
  Widget build(BuildContext context) {
    // Shadow scales proportionally but subtle
    final shadowBlur = size * 0.12;
    final shadowOffset = size * 0.05;

    return showImage ? Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: shadowBlur,
            offset: Offset(0, shadowOffset),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    ) : const SizedBox.shrink();
  }
}

class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFEA6A12)
      ..strokeWidth = 3 // fixed stroke
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const dashWidth = 15.0; // fixed
    const dashSpace = 15.0; // fixed

    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    double startAngle = 0;
    const totalAngle = 2 * math.pi;

    while (startAngle < totalAngle) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        dashWidth / radius,
        false,
        paint,
      );
      startAngle += (dashWidth + dashSpace) / radius;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
