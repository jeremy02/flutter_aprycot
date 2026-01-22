import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/screens/authentication/components/auth_primary_button.dart';
import 'package:get/get.dart';
import '../../../../controllers/authentication_controller.dart';
import '../../components/auth_checkbox_actions_field.dart';
import '../../components/auth_pages_header.dart';
import '../../components/auth_text_field.dart';

class SignInFormSection extends StatelessWidget {
  SignInFormSection({super.key});

  // Initialize controller
  final AuthenticationController controller = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(80, 80, 0, 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthPagesHeader(
              title: 'Sign In',
              subtitle: 'Sign in to stay connected.',
            ),
            const SizedBox(height: 16),
            AuthTextField(
              label: 'Email',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            AuthTextField(
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
                  // navigation or logic
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
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    'or sign in with other accounts?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF07143B),
                      letterSpacing: -0.5,
                    ),
                  ),
                ]
              ),
            ),
            const SizedBox(height: 16),
            // Social Login Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.socialIcons.map((iconPath) {
                int index = controller.socialIcons.indexOf(iconPath);
                return Row(
                  children: [
                    _buildSocialIcon(iconPath),
                    if (index != controller.socialIcons.length - 1) const SizedBox(width: 16),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF07143B),
                      letterSpacing: -0.8,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Click here to sign up.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFEA6A12),
                        letterSpacing: -0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String socialIconImagePath) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () {},
        customBorder: const CircleBorder(),
        splashColor: Colors.black12,
        highlightColor: Colors.black12,
        child: Ink(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          child: Center(
            child: Image.asset(
              socialIconImagePath,
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
