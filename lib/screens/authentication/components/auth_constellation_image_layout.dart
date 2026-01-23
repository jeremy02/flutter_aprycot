import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/models/auth/auth_constellation_image_item.dart';

import 'auth_circle_image.dart';

class AuthConstellationImageLayout extends StatelessWidget {
  final List<AuthConstellationImageItem> items;

  const AuthConstellationImageLayout({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: LayoutBuilder(
        builder: (_, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          return Stack(
            children: items.map((item) {
              final size = w * item.sizeFactor;

              return Positioned(
                left: w * item.x - size / 2,
                top: h * item.y - size / 2,
                child: AuthCircleImage(
                  size: size,
                  showImage: item.showImage,
                  imagePath: item.imagePath,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}