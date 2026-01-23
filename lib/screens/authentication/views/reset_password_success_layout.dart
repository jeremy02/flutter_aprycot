import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/app_navigation_controller.dart';
import '../../../controllers/authentication_controller.dart';
import '../components/auth_header_section.dart';
import '../components/auth_primary_button.dart';

class ResetPasswordSuccessLayout extends StatelessWidget {
  final AuthenticationController controller;

  const ResetPasswordSuccessLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(80, 80, 0, 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthHeaderSection(
              title: 'Success !',
              subtitle: 'A email has been send to your email@domain.com.\n'
                  'Please check for an email from company and click\n'
                  'the included link to reset your password.',
              titleImagePath: 'images/auth_images/success_icon.png',
            ),
            const SizedBox(height: 16),
            AuthPrimaryButton(
              label: 'Back to home',
              onPressed: () {
                final navController = Get.find<AppNavigationController>();
                navController.navigateTo('dashboard');
              },
              widthFactor: 0.50,
            ),
          ],
        ),
      ),
    );
  }
}
