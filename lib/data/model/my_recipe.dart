class MyRecipeModel {
  final int id, categoryId;
  final String title, description,difficulty;
  final String photo;
  final int timeRequired;

  final num rating;

  MyRecipeModel( {
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory MyRecipeModel.fromJson(Map<String, dynamic> json) {
    return MyRecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      difficulty: json['difficulty,'],
    );
  }
}
