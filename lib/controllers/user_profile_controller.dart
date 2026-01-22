import 'package:get/get.dart';

import '../models/auth/user_profile.dart';

class UserProfileController extends GetxController {
  // create the observable UserProfile object
  var user = UserProfile(
    backgroundImage: 'images/user_profile/user_profile_banner_image.png',
    avatarImage: 'images/user_profile/user_profile_male_avatar.png',
    locationImage: 'images/user_profile/navigation_icon.png',
    name: 'Devon Lane',
    role: 'UI/UX Designer',
    location: 'Lisbon, Portugal',
    email: 'Hello@gmail.com',
    reviews: 142,
    photos: 201,
    followers: '3.1k',
  ).obs;

  // these are just examples of updating any field
  void updateName(String newName) {
    user.update((val) {
      val?.name = newName;
    });
  }

  void updateStats(int reviews, int photos, String followers) {
    user.update((val) {
      val?.reviews = reviews;
      val?.photos = photos;
      val?.followers = followers;
    });
  }
}
