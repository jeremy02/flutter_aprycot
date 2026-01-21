import 'package:get/get.dart';

class AuthImageItem {
  final String imagePath;
  final double sizeFactor;
  final int minutePosition;
  final RxBool showImage;

  AuthImageItem({
    required this.imagePath,
    required this.sizeFactor,
    required this.minutePosition,
    bool showImage = true,
  }) : showImage = showImage.obs;
}
