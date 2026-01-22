import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import '../../../controllers/authentication_controller.dart';
import '../components/auth_images_layout.dart';
import 'sections/sign_in_form_section.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
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
                children: [
                  Flexible(
                    flex: 39,
                    child: SignInFormSection(controller: controller),
                  ),
                  const SizedBox(width: 60,),
                  Flexible(
                    flex: 63,
                    child: AuthImagesLayout(
                        items: controller.signInAuthImageItems
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
