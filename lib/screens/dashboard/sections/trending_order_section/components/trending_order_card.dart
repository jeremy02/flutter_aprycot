import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../models/menu_items/menu_item.dart';

class TrendingOrderCard extends StatelessWidget {
  final MenuItem trendingOrder;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onAddTap;

  const TrendingOrderCard({
    super.key,
    required this.trendingOrder,
    required this.isSelected,
    required this.onTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    const imageSize = 130.0;
    const imageOverhang = 50.0;

    return Padding(
      padding: const EdgeInsets.only(right: imageOverhang),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            color: isSelected ? const Color(0xFFE89261) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            elevation: 3,
            shadowColor: Colors.black.withOpacity(0.08),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if(trendingOrder.badge != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/trending_items/trending_icon_crown.png',
                            height: 14,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            trendingOrder.badge ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white : const Color(0xFFEA6A12),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 16),
                    Text(
                      trendingOrder.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF07143B),
                        height: 1.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${trendingOrder.calories} Calories',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white.withOpacity(0.8) : const Color(0xFF959895),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 36,
                      height: 1,
                      color: isSelected ? Colors.white.withOpacity(0.8) : Color(0xFF959895),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${trendingOrder.persons} persons',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white.withOpacity(0.8) : const Color(0xFF959895),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          '\$${trendingOrder.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFFEA6A12),
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(width: 28),
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
          Positioned(
            right: -imageOverhang,
            top: 0,
            bottom: 0,
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
                    trendingOrder.imagePath,
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