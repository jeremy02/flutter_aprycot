import 'dart:ui';

import 'package:flutter/material.dart';

import 'user_profile_stats_card.dart';

class UserProfileBottomOverlay extends StatelessWidget {
  final String locationImage;
  final double borderRadius;
  final double avatarSize;
  final double overlayPaddingLeft;
  final double bottomBarHeight;
  final String name;
  final String role;
  final String location;
  final String email;
  final int reviews;
  final int photos;
  final String followers;

  const UserProfileBottomOverlay({
    super.key,
    required this.locationImage,
    required this.borderRadius,
    required this.avatarSize,
    required this.overlayPaddingLeft,
    required this.bottomBarHeight,
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.reviews,
    required this.photos,
    required this.followers,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: bottomBarHeight, // TODO - Check if we can get rid of this
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            color: Colors.white.withOpacity(0.5),
            padding: EdgeInsets.only(left: overlayPaddingLeft, right: 16, top: 16, bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Color(0xFFEA6A12),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Image.asset(
                              locationImage,
                              fit: BoxFit.cover,
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location,
                              style: const TextStyle(
                                color: Color(0xFF07143B),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          role,
                          style: const TextStyle(
                            color: Color(0xFF07143B),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          email,
                          style: const TextStyle(
                            color: Color(0xFF07143B),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Email',
                          style: const TextStyle(
                            color: Color(0xFF07143B),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                // Stats
                Row(
                  children: [
                    UserProfileStatsCard(label: 'Reviews', value: reviews.toString()),
                    const SizedBox(width: 8),
                    UserProfileStatsCard(label: 'Photos', value: photos.toString()),
                    const SizedBox(width: 8),
                    UserProfileStatsCard(label: 'Followers', value: followers),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}