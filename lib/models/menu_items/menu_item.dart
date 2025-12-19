class MenuItem {
  final String name;
  final double price;
  final double? originalPrice;
  final double rating;
  final String imagePath;

  MenuItem({
    required this.name,
    required this.price,
    this.originalPrice,
    required this.rating,
    required this.imagePath,
  });
}