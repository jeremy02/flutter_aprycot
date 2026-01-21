class UserProfile {
  String backgroundImage;
  String avatarImage;
  String locationImage;
  String name;
  String role;
  String location;
  String email;
  int reviews;
  int photos;
  String followers;

  UserProfile({
    required this.backgroundImage,
    required this.avatarImage,
    required this.locationImage,
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.reviews,
    required this.photos,
    required this.followers,
  });
}
