import 'package:flutter/material.dart';
import 'sections/user_profile_banner_section/user_profile_banner_section.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserProfileBannerSection(
          backgroundImage: 'images/user_profile/user_profile_banner_image.png',
          avatarImage: 'images/user_profile/user_profile_male_avatar.png',
          name: 'Devon Lane',
          role: 'UI/UX Designer',
          location: 'Lisbon, Portugal',
          email: 'Hello@gmail.com',
          reviews: 142,
          photos: 201,
          followers: '3.1k',
        ),
        const SizedBox(height: 24.0,),
      ],
    );
  }
}
