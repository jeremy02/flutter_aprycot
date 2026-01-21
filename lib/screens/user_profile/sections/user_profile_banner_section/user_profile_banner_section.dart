import 'package:flutter/material.dart';

class UserProfileBannerSection extends StatelessWidget {
  const UserProfileBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 20.0, 20.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'images/user_profile/user_profile_banner_image.png',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
