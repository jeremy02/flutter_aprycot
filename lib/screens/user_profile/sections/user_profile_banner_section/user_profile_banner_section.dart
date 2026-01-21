import 'dart:ui';
import 'package:flutter/material.dart';

class UserProfileBannerSection extends StatelessWidget {
  final String backgroundImage;
  final String avatarImage;
  final String name;
  final String role;
  final String location;
  final String email;
  final int reviews;
  final int photos;
  final String followers;
  final double borderRadius;
  final double cardHeight;

  const UserProfileBannerSection({
    super.key,
    required this.backgroundImage,
    required this.avatarImage,
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.reviews,
    required this.photos,
    required this.followers,
    this.borderRadius = 20,
    this.cardHeight = 400,
  });

  @override
  Widget build(BuildContext context) {
    const avatarSize = 80.0;
    const bottomBarHeight = 100.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(24.0, 20.0, 20.0, 0.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Card with background image and rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: SizedBox(
              height: cardHeight,
              child: Stack(
                children: [
                  _buildProfileBannerBackgroundImage(backgroundImage),
                  // Bottom frosted overlay
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    // height: bottomBarHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(borderRadius),
                        bottomRight: Radius.circular(borderRadius),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          color: Colors.white.withOpacity(0.2),
                          padding: const EdgeInsets.only(left: avatarSize + 40, right: 16, top: 20, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                      // fontWeight: FontWeight.bold,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/user_profile/navigation_icon.png',
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
                                  const SizedBox(height: 4,),
                                  Text(
                                    email,
                                    style: const TextStyle(
                                      color: Color(0xFF07143B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
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
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _UserProfileStatBox(label: 'Reviews', value: reviews.toString()),
                                  const SizedBox(width: 8),
                                  _UserProfileStatBox(label: 'Photos', value: photos.toString()),
                                  const SizedBox(width: 8),
                                  _UserProfileStatBox(label: 'Followers', value: followers),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Avatar half inside/outside card
          Positioned(
            top: cardHeight - bottomBarHeight - (avatarSize / 2) + 16,
            left: 30,
            child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(avatarImage),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileBannerBackgroundImage(String backgroundImage) {
    return Positioned.fill(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 0,
        child: Image.asset(
          backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _UserProfileStatBox extends StatelessWidget {
  final String label;
  final String value;

  const _UserProfileStatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFFEA6A12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8,),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
