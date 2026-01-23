import '../auth_constellation_image_item.dart';
import '../auth_image_item.dart';

class AuthImageItems {
  // list of image items for sign in page/screen
  static final List<AuthImageItem> signInAuthImageItems = [
    AuthImageItem(
      sizeFactor: 0.20,
      minutePosition: 0,
      imagePath: 'images/auth_images/auth_items_image_1.png',
      showImage: false,
    ),
    AuthImageItem(
      sizeFactor: 0.20,
      minutePosition: 5,
      imagePath: 'images/auth_images/auth_items_image_1.png',
      showImage: true,
    ),
    AuthImageItem(
      sizeFactor: 0.20,
      minutePosition: 15,
      imagePath: 'images/auth_images/auth_items_image_2.png',
      showImage: true,
    ),
    AuthImageItem(
      sizeFactor: 0.20,
      minutePosition: 25,
      imagePath: 'images/auth_images/auth_items_image_3.png',
      showImage: true,
    ),
    AuthImageItem(
      sizeFactor: 0.40,
      minutePosition: 35,
      imagePath: 'images/auth_images/auth_items_image_4.png',
      showImage: true,
    ),
    AuthImageItem(
      sizeFactor: 0.20,
      minutePosition: 45,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),
    AuthImageItem(
      sizeFactor: 0.20,
      minutePosition: 55,
      imagePath: 'images/auth_images/auth_items_image_6.png',
      showImage: true,
    ),
  ];

  // list of image items for sign up page/screen
  static final List<AuthImageItem> signUpAuthImageItems = [
    AuthImageItem(
      sizeFactor: 0.20,
      minutePosition: 0,
      imagePath: 'images/auth_images/auth_items_image_1.png',
      showImage: false,
    ),
    AuthImageItem(
      sizeFactor: 0.20,
      minutePosition: 5,
      imagePath: 'images/auth_images/auth_items_image_7.png',
      showImage: true,
    ),
    AuthImageItem(
      sizeFactor: 0.28,
      minutePosition: 15,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),
    AuthImageItem(
      sizeFactor: 0.40,
      minutePosition: 30,
      imagePath: 'images/auth_images/auth_items_image_4.png',
      showImage: true,
    ),
    AuthImageItem(
      sizeFactor: 0.28,
      minutePosition: 45,
      imagePath: 'images/auth_images/auth_items_image_2.png',
      showImage: true,
    ),
    AuthImageItem(
      sizeFactor: 0.20,
      minutePosition: 55,
      imagePath: 'images/auth_images/auth_items_image_3.png',
      showImage: true,
    ),
  ];

  // list of image items for sign in reset_password and reset reset_password_success screen
  static final resetPasswordImageItems = <AuthConstellationImageItem>[
    // images for top row
    const AuthConstellationImageItem(
        x: 0.15,
        y: 0.20,
        sizeFactor: 0.25,
        imagePath: 'images/auth_images/auth_items_image_5.png',
    ),
    const AuthConstellationImageItem(
        x: 0.48,
        y: 0.12,
        sizeFactor: 0.18,
        imagePath: 'images/auth_images/auth_items_image_5.png',
    ),
    const AuthConstellationImageItem(
      x: 0.78,
      y: 0.13,
      sizeFactor: 0.18,
      imagePath: 'images/auth_images/auth_items_image_5.png',
    ),

    // images for middle row
    const AuthConstellationImageItem(
        x: 0.25,
        y: 0.50,
        sizeFactor: 0.20,
        imagePath: 'images/auth_images/auth_items_image_5.png',
    ),
    const AuthConstellationImageItem(
        x: 0.56,
        y: 0.40,
        sizeFactor: 0.20,
        imagePath: 'images/auth_images/auth_items_image_5.png',
    ),
    const AuthConstellationImageItem(
        x: 0.88,
        y: 0.38,
        sizeFactor: 0.20,
        imagePath: 'images/auth_images/auth_items_image_5.png',
    ),

    // images for bottom row
    const AuthConstellationImageItem(
        x: 0.45,
        y: 0.70,
        sizeFactor: 0.22,
        imagePath: 'images/auth_images/auth_items_image_5.png',
    ),
    const AuthConstellationImageItem(
        x: 0.78,
        y: 0.70,
        sizeFactor: 0.22,
        imagePath: 'images/auth_images/auth_items_image_5.png',
    ),
  ];
}
