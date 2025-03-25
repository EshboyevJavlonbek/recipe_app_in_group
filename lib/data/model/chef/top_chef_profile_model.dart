class TopChefProfileModel {
  final int id;
  final String image, username, firstName, lastName, presentation;
  final int recipesCount, followingCount, followerCount;

  TopChefProfileModel({
    required this.id,
    required this.image,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory TopChefProfileModel.fromJson(Map<String, dynamic> json) {
    return TopChefProfileModel(
      id: json['id'],
      image: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      presentation: json['presentation'],
      recipesCount: json['recipesCount'],
      followingCount: json['followingCount'],
      followerCount: json['followerCount'],
    );
  }
}
