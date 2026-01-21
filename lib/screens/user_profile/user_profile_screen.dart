import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/screens/dashboard/sections/banner-section/banner_section.dart';
import 'package:flutter_sidebar_x/screens/dashboard/sections/menu_section/menu_section.dart';
import 'package:flutter_sidebar_x/screens/dashboard/sections/trending_order_section/trending_order_section.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 360,
          width: double.infinity,
          color: Colors.red,
        ),
        const SizedBox(height: 24.0,),
      ],
    );
  }
}
