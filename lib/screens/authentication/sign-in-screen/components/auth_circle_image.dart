import 'package:flutter/material.dart';
import '../../../../models/auth/auth_image_item.dart';

class AuthCircleImage extends StatelessWidget {
  final AuthImageItem imageItem;
  final double size;

  const AuthCircleImage({
    super.key,
    required this.imageItem,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final shadowBlur = size * 0.12;
    final shadowOffset = size * 0.05;

    return imageItem.showImage ? Container(
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
          image: AssetImage(imageItem.imagePath),
          fit: BoxFit.cover,
        ),
      ),
    ) : const SizedBox.shrink();
  }
}
