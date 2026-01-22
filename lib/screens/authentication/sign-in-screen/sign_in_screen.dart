import 'package:flutter/material.dart';
import 'package:flutter_sidebar_x/screens/authentication/sign-in-screen/components/sign_in_form.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import '../../../controllers/authentication_controller.dart';
import '../components/auth_images_layout.dart';
import '../sign-up-screen/components/sign_up_form.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 39,
                    child: SignInForm(controller: controller),
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
