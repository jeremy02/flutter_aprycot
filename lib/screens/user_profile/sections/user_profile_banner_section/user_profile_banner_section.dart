import 'package:flutter/material.dart';
import 'components/user_profile_bottom_overlay.dart';

class UserProfileBannerSection extends StatelessWidget {
  final String backgroundImage;
  final String avatarImage;
  final String locationImage;
  final String name;
  final String role;
  final String location;
  final String email;
  final int reviews;
  final int photos;
  final String followers;
  final double borderRadius;
  final double cardHeight;
  final double cardWidth;

  const UserProfileBannerSection({
    super.key,
    required this.backgroundImage,
    required this.avatarImage,
    required this.locationImage,
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.reviews,
    required this.photos,
    required this.followers,
    this.borderRadius = 20,
    this.cardHeight = 450,
    this.cardWidth = 350,
  });

  @override
  Widget build(BuildContext context) {
    // Compute proportional sizes based on cardHeight
    final avatarSize = cardHeight * 0.22; // 27% of card height
    final bottomBarHeight = cardHeight * 0.21; // 33% of card height
    final overlayPaddingLeft = avatarSize + cardWidth * 0.15;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: cardWidth * 0.05, vertical: cardHeight * 0.05),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // the background Card with image and rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: SizedBox(
              height: cardHeight,
              child: Stack(
                children: [
                  _ProfileBackgroundImage(imagePath: backgroundImage, borderRadius: borderRadius),
                  UserProfileBottomOverlay(
                    locationImage: locationImage,
                    borderRadius: borderRadius,
                    avatarSize: avatarSize,
                    overlayPaddingLeft: overlayPaddingLeft,
                    bottomBarHeight: bottomBarHeight,
                    name: name,
                    role: role,
                    location: location,
                    email: email,
                    reviews: reviews,
                    photos: photos,
                    followers: followers,
                  ),
                ],
              ),
            ),
          ),
          // Avatar half inside/outside card
          Positioned(
            top: cardHeight - bottomBarHeight - (avatarSize / 2) + 20,
            left: cardWidth * 0.08,
            child: _ProfileAvatar(imagePath: avatarImage, size: avatarSize),
          ),
        ],
      ),
    );
  }
}

// the background image for profile card
class _ProfileBackgroundImage extends StatelessWidget {
  final String imagePath;
  final double borderRadius;

  const _ProfileBackgroundImage({required this.imagePath, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// the avatar widget
class _ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final double size;

  const _ProfileAvatar({required this.imagePath, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
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
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}