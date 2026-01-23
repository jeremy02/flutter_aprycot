import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/app_navigation_controller.dart';
import '../../../../controllers/authentication_controller.dart';
import '../../components/auth_checkbox_actions_field.dart';
import '../../components/auth_footer_section.dart';
import '../../components/auth_header_section.dart';
import '../../components/auth_primary_button.dart';
import '../../components/auth_text_input_field.dart';

class SignInForm extends StatelessWidget {
  final AuthenticationController controller;

  const SignInForm({super.key, required this.controller});

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
              title: 'Sign In',
              subtitle: 'Sign in to stay connected.',
            ),
            const SizedBox(height: 16),
            AuthTextInputField(
              label: 'Email',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            AuthTextInputField(
              label: 'Password',
              controller: controller.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            Obx(
              () => AuthCheckboxActionsField(
                centerWidget: false,
                checkboxText: 'Remember me?',
                isChecked: controller.rememberMe.value,
                onToggle: () => controller.toggleRememberMe(!controller.rememberMe.value),
                secondActionText: 'Forgot Password',
                onSecondAction: () {
                  final navController = Get.find<AppNavigationController>();
                  // Navigate to top-level Authentication, Reset Password screen
                  navController.navigateTo('authentication', pageName: 'Reset Password');
                },
              ),
            ),
            const SizedBox(height: 16),
            AuthPrimaryButton(
              label: 'Sign in',
              onPressed: () => {},
              widthFactor: 0.33,
            ),
            const SizedBox(height: 16),
            AuthFooterSection(
              labelText: 'or sign in with other accounts?',
              socialIcons: controller.socialIcons,
              onSocialIconPressed: (id, imagePath) {
                print('Sign in via $id');
              },
              labelTextDescription: "Don't have an account? ",
              labelActionText: 'Click here to sign up.',
              onLabelActionTextPressed: () {
                final navController = Get.find<AppNavigationController>();
                // Navigate to top-level Authentication, Signup screen
                navController.navigateTo('authentication', pageName: 'Sign Up');
              },
            ),
          ],
        ),
      ),
    );
  }
}
