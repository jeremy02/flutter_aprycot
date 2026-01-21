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
        UserProfileBannerSection(),
        const SizedBox(height: 24.0,),
      ],
    );
  }
}
