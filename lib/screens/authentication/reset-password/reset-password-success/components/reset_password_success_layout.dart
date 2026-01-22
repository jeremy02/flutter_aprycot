import 'package:flutter/material.dart';
import '../../../../../controllers/authentication_controller.dart';
import '../../../components/auth_header_section.dart';

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
              subtitle: 'A email has been sent to your email@domain.com. Please check for an email from company and click on the included link to reset your password.',
              titleImagePath: 'images/auth_images/success_icon.png',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
