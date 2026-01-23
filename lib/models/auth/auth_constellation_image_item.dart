class AuthConstellationImageItem {
  final double x;
  final double y;
  final double sizeFactor;
  final String imagePath;
  final bool showImage;

  const AuthConstellationImageItem({
    required this.x,
    required this.y,
    required this.sizeFactor,
    required this.imagePath,
    this.showImage = true,
  });
}
