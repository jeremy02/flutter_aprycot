import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import '../../../controllers/authentication_controller.dart';
import '../components/auth_images_layout.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final AuthenticationController controller = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8ED),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                height: math.max(800, constraints.maxHeight * 0.9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 44,
                    child: SignUpForm(controller: controller),
                  ),
                  const SizedBox(width: 60,),
                  Flexible(
                    flex: 56,
                    child: AuthImagesLayout(
                        items: controller.signUpAuthImageItems
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
