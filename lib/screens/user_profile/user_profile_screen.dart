import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_profile_controller.dart';
import 'sections/user_profile_banner_section/user_profile_banner_section.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  final UserProfileController controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          final user = controller.user.value;
          return UserProfileBannerSection(
            backgroundImage: user.backgroundImage,
            avatarImage: user.avatarImage,
            locationImage: user.locationImage,
            name: user.name,
            role: user.role,
            location: user.location,
            email: user.email,
            reviews: user.reviews,
            photos: user.photos,
            followers: user.followers,
          );
        }),
        const SizedBox(height: 24),
      ],
    );
  }
}
