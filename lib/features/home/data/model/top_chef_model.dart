class TopChefModel {
  final int id;
  final String firstName, photo;

  TopChefModel({
    required this.id,
    required this.photo,
    required this.firstName,
  });

  factory TopChefModel.fromJson(Map<String, dynamic> json) {
    return TopChefModel(
      id: json['id'],
      photo: json['photo'],
      firstName: json['firstName'],
    );
  }
}
