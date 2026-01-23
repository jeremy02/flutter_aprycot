class AuthImageItem {
  final double sizeFactor;
  final int minutePosition;
  final String imagePath;
  final bool showImage;

  AuthImageItem({
    required this.sizeFactor,
    required this.minutePosition,
    required this.imagePath,
    this.showImage = true,
  });
}
