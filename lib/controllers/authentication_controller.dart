import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/auth/auth_image_item.dart';
import '../models/auth/data/auth_image_items.dart';

class AuthenticationController extends GetxController {
  // this is for the images on the sign in page/screen
  final List<AuthImageItem> signInAuthImageItems = AuthImageItems.signInAuthImageItems;

  // this is for the images on the sign up page/screen
  final List<AuthImageItem> signUpAuthImageItems = AuthImageItems.signUpAuthImageItems;

  // for checkbox state
  var rememberMe = false.obs;

  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // list of social icons (map of image path to platform id)
  var socialIcons = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // initialize social icons
    socialIcons.addAll([
      {'image': 'images/auth_images/gmail_icon.png', 'id': 'gmail'},
      {'image': 'images/auth_images/facebook_icon.png', 'id': 'facebook'},
      {'image': 'images/auth_images/instagram_icon.png', 'id': 'instagram'},
      {'image': 'images/auth_images/linkedin_icon.png', 'id': 'linkedin'},
    ]);
  }

  // toggle the remember me
  void toggleRememberMe([bool? value]) {
    if (value != null) {
      rememberMe.value = value;
    } else {
      rememberMe.value = !rememberMe.value;
    }
  }

  // clean up text controllers
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
