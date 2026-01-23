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
      x: 0.12,
      y: 0.26,
      sizeFactor: 0.25,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),
    const AuthConstellationImageItem(
      x: 0.43,
      y: 0.16,
      sizeFactor: 0.25,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),
    const AuthConstellationImageItem(
      x: 0.78,
      y: 0.16,
      sizeFactor: 0.25,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),

    // images for middle row
    const AuthConstellationImageItem(
      x: 0.25,
      y: 0.56,
      sizeFactor: 0.25,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),
    const AuthConstellationImageItem(
      x: 0.58,
      y: 0.50,
      sizeFactor: 0.25,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),
    const AuthConstellationImageItem(
      x: 0.87,
      y: 0.48,
      sizeFactor: 0.25,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),

    // images for bottom row
    const AuthConstellationImageItem(
      x: 0.37,
      y: 0.83,
      sizeFactor: 0.25,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),
    const AuthConstellationImageItem(
      x: 0.75,
      y: 0.83,
      sizeFactor: 0.25,
      imagePath: 'images/auth_images/auth_items_image_5.png',
      showImage: true,
    ),
  ];
}
