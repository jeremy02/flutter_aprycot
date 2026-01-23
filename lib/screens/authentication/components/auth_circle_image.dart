import 'package:flutter/material.dart';

class AuthCircleImage extends StatelessWidget {
  final double size;
  final bool showImage;
  final String imagePath;

  const AuthCircleImage({
    super.key,
    required this.size,
    required this.showImage,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final shadowBlur = size * 0.12;
    final shadowOffset = size * 0.02;

    return showImage ? Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE60A0A).withOpacity(0.18),
            blurRadius: shadowBlur,
            offset: Offset(0, shadowOffset),
            spreadRadius: -30,
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
