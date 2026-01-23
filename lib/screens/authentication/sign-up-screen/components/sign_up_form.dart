import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/app_navigation_controller.dart';
import '../../../../controllers/authentication_controller.dart';
import '../../components/auth_checkbox_actions_field.dart';
import '../../components/auth_footer_section.dart';
import '../../components/auth_header_section.dart';
import '../../components/auth_primary_button.dart';
import '../../components/auth_text_input_field.dart';

class SignUpForm extends StatelessWidget {
  final AuthenticationController controller;

  const SignUpForm({super.key, required this.controller});

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
              title: 'Sign Up',
              subtitle: 'Create your Hope UI account.',
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AuthTextInputField(
                    label: 'First Name',
                    controller: controller.firstNameController,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AuthTextInputField(
                    label: 'Last Name',
                    controller: controller.lastNameController,
                    keyboardType: TextInputType.name,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AuthTextInputField(
                    label: 'Email',
                    controller: controller.emailSignUpController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AuthTextInputField(
                    label: 'Last Name',
                    controller: controller.phoneNumberController,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AuthTextInputField(
                    label: 'Password',
                    controller: controller.passwordSignUpController,
                    obscureText: true,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AuthTextInputField(
                    label: 'Confirm Password',
                    controller: controller.confirmPasswordSignUpController,
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => AuthCheckboxActionsField(
                centerWidget: true,
                checkboxText: 'I agree with terms of use',
                isChecked: controller.termsOfUse.value,
                onToggle: () => controller.toggleTermsOfUse(!controller.termsOfUse.value),
                secondActionText: null,
                onSecondAction: null,
              ),
            ),
            const SizedBox(height: 16),
            AuthPrimaryButton(
              label: 'Sign up',
              onPressed: () => {},
              widthFactor: 0.33,
            ),
            const SizedBox(height: 16),
            AuthFooterSection(
              labelText: 'or sign up with other accounts?',
              socialIcons: controller.socialIcons,
              onSocialIconPressed: (id, imagePath) {
                print('Sign up via $id');
              },
              labelTextDescription: "Already have an Account, ",
              labelActionText: 'Sign in.',
              onLabelActionTextPressed: () {
                final navController = Get.find<AppNavigationController>();
                // Navigate to top-level Authentication, Signin screen
                navController.navigateTo('authentication');
              },
            ),
          ],
        ),
      ),
    );
  }
}
