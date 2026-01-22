

class AuthImageItem {
  final String imagePath;
  final double sizeFactor;
  final int minutePosition;
  final bool showImage;

  AuthImageItem({
    required this.imagePath,
    required this.sizeFactor,
    required this.minutePosition,
    this.showImage = true,
  });
}
