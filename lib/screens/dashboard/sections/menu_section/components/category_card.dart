import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/models/menu_category/menu_category_item.dart';
import 'arrow_icon_button.dart';

class CategoryCard extends StatelessWidget {
  final MenuCategoryItem category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFEA6A12)
                : Colors.white, // Color(0xFFFAFAFA)
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildMenuCategoryImage(context, category.iconPath, isSelected),
              SizedBox(
                height: 30,
              ),
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : const Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: isSelected ? 56 : 36,
                height: 2,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white : const Color(0xFFEA6A12),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              ArrowIconButton(isSelected),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildMenuCategoryImage(BuildContext context, String iconPath, bool isSelected) {
  const double imageSize = 72;
  const double imageBorderWidth = 4;

  return Container(
    width: imageSize,
    height: imageSize,
    padding: const EdgeInsets.all(imageBorderWidth),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isSelected ? Colors.white : Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: CircleAvatar(
      radius: (imageSize - imageBorderWidth * 2) / 2,
      backgroundImage: AssetImage(iconPath),
      backgroundColor: Colors.transparent,
    ),
  );
}
