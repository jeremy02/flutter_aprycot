import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app_navigation_controller.dart';
import '../../../../../controllers/authentication_controller.dart';
import '../../../components/auth_header_section.dart';
import '../../../components/auth_primary_button.dart';
import '../../../components/auth_text_input_field.dart';

class ResetPasswordForm extends StatelessWidget {
  final AuthenticationController controller;

  const ResetPasswordForm({super.key, required this.controller});

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
              title: 'Reset Password',
              subtitle: 'Enter your email address and we\'ll send you an email'
                  'with instructions to reset your password.',
              titleImagePath: null,
            ),
            const SizedBox(height: 16),
            AuthTextInputField(
              label: 'Email',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            AuthPrimaryButton(
              label: 'Reset',
              onPressed: () {
                final navController = Get.find<AppNavigationController>();
                navController.navigateTo('authentication', pageName: 'Reset Password Success');
              },
              widthFactor: 0.33,
            ),
          ],
        ),
      ),
    );
  }
}
