import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.132.102:8888/api/v1',
      validateStatus: (status) => true,
    ),
  );

  Future<List<dynamic>> fetchCommunity(String order) async{
    var response = await dio.get('/recipes/community/list?Order=$order');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    }else {
      throw Exception("/recipes/community so'rovimizda xatolik!");
    }
  }

  Future<List<dynamic>> fetchYourRecipes()async{
    var response = await dio.get('/recipes/list?Limit=2');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    }else{
      throw Exception("/recipes/list so'rovimiz oxshamadi");
    }
  }

  Future<Map<String, dynamic>> fetchTrendingRecipe()async{
    var response = await dio.get('/recipes/trending-recipe');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    }else {
      throw Exception("/recipes/trending-recipe so'rovimiz o'xshamadi");
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/categories/list so'rovimiz o'xshamadi!");
    }
  }

  Future<List<dynamic>> fetchRecipesByCategory(int categoryId) async {
    var response = await dio.get('/recipes/list?Category=$categoryId');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/recipes/list?Category=$categoryId so'rovimiz o'xshamadi");
    }
  }

  Future<Map<String, dynamic>> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('/recipes/detail/$recipeId sorovimiz xato ketti');
    }
  }
}
