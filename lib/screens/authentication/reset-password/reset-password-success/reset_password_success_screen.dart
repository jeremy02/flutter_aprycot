import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/authentication_controller.dart';
import 'components/reset_password_success_layout.dart';

class ResetPasswordSuccessScreen extends StatelessWidget {
  ResetPasswordSuccessScreen({super.key});

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
                    child: ResetPasswordSuccessLayout(controller: controller,),
                  ),
                  const SizedBox(width: 60,),
                  Expanded(
                    flex: 63,
                    child: Container(),
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
