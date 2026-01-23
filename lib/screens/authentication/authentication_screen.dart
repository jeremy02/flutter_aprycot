import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/app_navigation_controller.dart';
import '../../controllers/authentication_controller.dart';
import '../../models/auth/auth_page.dart';
import 'components/auth_constellation_image_layout.dart';
import 'components/auth_images_layout.dart';
import 'views/reset_password_success_layout.dart';
import 'views/reset_password_form.dart';
import 'views/sign_in_form.dart';
import 'views/sign_up_form.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});

  final AppNavigationController navController =
  Get.find<AppNavigationController>();
  final AuthenticationController authController =
  Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8ED),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = math.max(800, constraints.maxHeight * 0.9).toDouble();

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: maxHeight),
              child: Obx(() {
                final page = navController.currentAuthPage.value;

                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.08, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: _buildPageWithSwitch(page),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  // Switch to control both widgets and flexes per page
  Widget _buildPageWithSwitch(AuthPage page) {
    switch (page) {
      case AuthPage.signUp:
        return Row(
          key: const ValueKey('signup'),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 44, child: SignUpForm(controller: authController)),
            const SizedBox(width: 60),
            Flexible(
              flex: 56,
              child: AuthImagesLayout(items: authController.signUpAuthImageItems),
            ),
          ],
        );
      case AuthPage.resetPassword:
        return Row(
          key: const ValueKey('reset'),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 39, child: ResetPasswordForm(controller: authController)),
            const SizedBox(width: 60),
            Flexible(
              flex: 61,
              child: AuthConstellationImageLayout(
                  items: authController.resetPasswordImageItems),
            ),
          ],
        );
      case AuthPage.resetPasswordSuccess:
        return Row(
          key: const ValueKey('success'),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 39,
                child: ResetPasswordSuccessLayout(controller: authController)),
            const SizedBox(width: 60),
            Flexible(
              flex: 61,
              child: AuthConstellationImageLayout(
                  items: authController.resetPasswordImageItems),
            ),
          ],
        );
      case AuthPage.signIn:
      default:
        return Row(
          key: const ValueKey('signin'),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 39, child: SignInForm(controller: authController)),
            const SizedBox(width: 60),
            Flexible(
              flex: 63,
              child: AuthImagesLayout(items: authController.signInAuthImageItems),
            ),
          ],
        );
    }
  }
}
