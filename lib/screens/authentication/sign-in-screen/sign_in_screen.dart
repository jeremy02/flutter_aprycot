import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import '../../../controllers/auth_image_items_controller.dart';
import '../components/auth_images_layout.dart';
import 'sections/sign_in_form_section.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final AuthImageItemsController controller = Get.put(AuthImageItemsController());

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
                    child: SignInFormSection(),
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
