import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/models/menu_category/menu_category_item.dart';

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
            boxShadow: isSelected
                ? [
              BoxShadow(
                color:
                const Color(0xFFEA6A12).withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ]
                : [],
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Icon(category.iconPath, isSelected),
              _Footer(category.name, isSelected),
            ],
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final String iconPath;
  final bool selected;

  const _Icon(this.iconPath, this.selected);

  static const double _size = 72;
  static const double _borderWidth = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      padding: const EdgeInsets.all(_borderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? Colors.white : Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: (_size - _borderWidth * 2) / 2,
        backgroundImage: AssetImage(iconPath),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final String name;
  final bool selected;

  const _Footer(this.name, this.selected);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color:
            selected ? Colors.white : const Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 40,
          height: 3,
          decoration: BoxDecoration(
            color: selected
                ? Colors.white.withOpacity(0.5)
                : const Color(0xFFEA6A12).withOpacity(0.3),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color:
            selected ? Colors.white : const Color(0xFFEA6A12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_forward,
            size: 16,
            color: selected
                ? const Color(0xFFEA6A12)
                : Colors.white,
          ),
        ),
      ],
    );
  }
}
