class ResponsiveGridCalculator {
  final double containerWidth;

  ResponsiveGridCalculator({required this.containerWidth});

  // constants
  static const double spacing = 20.0;
  static const double imageOverhang = 50.0;
  static const double minCardContentWidth = 220.0;
  static const double baseCardHeight = 220.0;

  int getCrossAxisCount() {
    final totalCardWidth = minCardContentWidth + imageOverhang + 10;
    if (containerWidth >= (totalCardWidth * 3 + spacing * 2)) return 3;
    return 2;
  }

  int getItemCount() {
    // You can customize item count based on screen size if needed
    return getCrossAxisCount() == 3 ? 6 : 6;
  }

  double getCardWidth() {
    final crossAxisCount = getCrossAxisCount();
    final totalSpacing = spacing * (crossAxisCount - 1);
    final availableWidth = containerWidth - totalSpacing;
    return availableWidth / crossAxisCount;
  }

  double getCardHeight() {
    final cardWidth = getCardWidth();
    double cardHeight = baseCardHeight;
    if (cardWidth < 260) cardHeight += 16;
    if (cardWidth < 220) cardHeight += 24;
    return cardHeight;
  }

  double getChildAspectRatio() {
    // return getCardWidth() / getCardHeight();
    return (getCardWidth() / getCardHeight())  + (getCrossAxisCount() == 3 ? 0.09 : 0.10);
  }

  double get getSpacing => spacing;
}
