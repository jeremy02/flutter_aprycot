import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../models/auth/auth_image_item.dart';
import 'auth_circle_image.dart';

class AuthImagesLayout extends StatelessWidget {
  final List<AuthImageItem> items;

  const AuthImagesLayout({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
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
              Positioned(
                left: center.dx - circleRadius,
                top: center.dy - circleRadius,
                child: CustomPaint(
                  size: Size(circleDiameter, circleDiameter),
                  painter: DashedCirclePainter(),
                ),
              ),
        
              ...items.asMap().entries.map((entry) {
                final item = entry.value;
                final itemSize = width * item.sizeFactor;
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
                  child: AuthCircleImage(
                    imageItem: item,
                    size: itemSize,
                  ),
                );
              }),
            ],
          );
        }),
      ),
    );
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
