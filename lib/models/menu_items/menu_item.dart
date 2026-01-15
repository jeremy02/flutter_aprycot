class MenuItem {
  final String name;
  final double price;
  final double? originalPrice;
  final double rating;
  final String imagePath;
  final int? calories;
  final int? persons;
  final String? badge;

  MenuItem({
    required this.name,
    required this.price,
    this.originalPrice,
    required this.rating,
    required this.imagePath,
    this.calories,
    this.persons,
    this.badge,
  });
}