class UserModelInReviews {
  final int id;
  final String username, profilePhoto;

  UserModelInReviews({
    required this.id,
    required this.username,
    required this.profilePhoto,
  });

  factory UserModelInReviews.fromJson(Map<String, dynamic> json) {
    return UserModelInReviews(
      id: json['id'],
      username: json['username'],
      profilePhoto: json['profilePhoto'],
    );
  }
}
