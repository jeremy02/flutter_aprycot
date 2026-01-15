import 'package:flutter/material.dart';
import '../../../../../models/menu_items/menu_item.dart';

class MenuItemsCard extends StatelessWidget {
  final MenuItem item;
  final double width;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onAddTap;

  const MenuItemsCard({
    super.key,
    required this.item,
    required this.width,
    required this.isSelected,
    required this.onTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    const double imageSize = 150.0;
    const double imageOverlap = imageSize / 2;

    return SizedBox(
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: imageOverlap + 20,
            left: 0,
            right: 0,
            bottom: 2,
            child: Material(
              color: isSelected ? const Color(0xFFEA6A12) : Colors.white,
              borderRadius: BorderRadius.circular(24),
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.06),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(24),
                splashColor: Colors.black.withOpacity(0.1),
                highlightColor: Colors.black.withOpacity(0.05),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: imageOverlap + 36,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF07143B),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(5, (index) {
                          final difference = item.rating - index;
                          Widget starIcon;
                          if (difference >= 1) {
                            starIcon = Icon(
                              Icons.star,
                              size: 16,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFFEA6A12),
                            );
                          } else if (difference > 0 && difference < 1) {
                            starIcon = Icon(
                              Icons.star_half,
                              size: 16,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFFEA6A12),
                            );
                          } else {
                            starIcon = Icon(
                              Icons.star_border,
                              size: 16,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFFEA6A12),
                            );
                          }
                          return Padding(
                            padding: EdgeInsets.only(right: index < 4 ? 2 : 0),
                            child: starIcon,
                          );
                        }),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Text(
                                  '\$${item.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: isSelected ? Colors.white : const Color(0xFFEA6A12),
                                  ),
                                ),
                                if (item.originalPrice != null) ...[
                                  const SizedBox(width: 6),
                                   Center(
                                    child: Text(
                                      '\$${item.originalPrice!.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: isSelected
                                            ? Colors.white.withOpacity(0.7)
                                            : const Color(0xFFE3E1E1),
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Material(
                            color: isSelected ? Colors.white : const Color(0xFFEA6A12),
                            shape: const CircleBorder(),
                            elevation: 4,
                            shadowColor: const Color(0xFFEA6A12).withOpacity(0.3),
                            child: InkWell(
                              onTap: onAddTap,
                              customBorder: const CircleBorder(),
                              splashColor: Colors.white.withOpacity(0.3),
                              highlightColor: Colors.white.withOpacity(0.1),
                              child: Container(
                                width: 28,
                                height: 28,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.add,
                                  color: isSelected ? const Color(0xFFEA6A12) : Colors.white,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}