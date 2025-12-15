import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/screens/dashboard/sections/banner-section/banner_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BannerSection(),
      ],
    );
  }
}
