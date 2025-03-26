import 'dart:io';

import 'package:dio/dio.dart';

import '../data/model/create_review_model.dart';
import '../data/model/user_model.dart';
import 'exceptions/auth_excaptions.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.16.102:8888/api/v1',
      validateStatus: (status) => true,
    ),
  );


  Future<T> genericGetRequest<T>(String path, {Map<String, dynamic>? queryParams}) async {
    var response = await dio.get(path, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return response.data as T;
    } else {
      throw DioException(requestOptions: response.requestOptions, response: response);
    }
  }

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );

    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(message: "Login qilib bo'madi, xullasi nimadur noto'g'ri ketgan.");
    }
  }

  Future<bool> signUp(UserModel model) async {
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );
    // return response.statusCode == 201 ? true : false;
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> uploadProfilePhoto(File file) async {
    FormData formData = FormData.fromMap(
      {"profilePhoto": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last)},
    );

    var response = await dio.patch(
      '/auth/upload',
      data: formData,
      options: Options(
        headers: {"Content-Type": "multipart/form-data"},
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchMyRecipes() async {
    final response = await dio.post(
      '/recipes/my-recipes',
      options: Options(
        headers: {
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJld0BnbWFpbC5jb20iLCJqdGkiOiJkMjMwNGRjMi1hZGM0LTRiN2UtYWM1YS0yMzdjZjViMTQxMmIiLCJ1c2VyaWQiOiIxIiwiZXhwIjoxODM3Njg3MzYwLCJpc3MiOiJsb2NhbGhvc3QiLCJhdWQiOiJhdWRpZW5jZSJ9.3qU31kMTaRTuZDnHJCA0QRoMuCu7SIqige42vNY5LDM",
        },
      ),
    );
    if (response.data == 200) {
      List<dynamic> data = response.data;
      return data;
    }else{
      throw Exception("/recipes/my-recipes");
    }
  }

  Future<bool> createReview(CreateReviewModel model) async {
    final formData = FormData.fromMap(await model.toJson());
    final response = await dio.post(
      '/reviews/create',
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuZHJld0BnbWFpbC5jb20iLCJqdGkiOiJkM2Y0YTYyYy05ODNhLTRjNGEtOTJkZi0wOGY1MzljYTdkYTUiLCJ1c2VyaWQiOiIxIiwiZXhwIjoxODM3MDc3MTgwLCJpc3MiOiJsb2NhbGhvc3QiLCJhdWQiOiJhdWRpZW5jZSJ9.SFnCH63mCRYApkVIvAP0bZkDByw9kFAtxTnloacxSN0",
        },
      ),
      data: formData,
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
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
    var response = await dio.get('/recipes/list', queryParameters: {"Category": categoryId});
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

  Future<Map<String, dynamic>> fetchTrendingRecipe() async {
    var response = await dio.get('/recipes/trending-recipe');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("/recipes/trending-recipe so'rovimiz o'xshamadi");
    }
  }

  Future<List<dynamic>> fetchYourRecipes({int? limit}) async {
    var response = await dio.get('/recipes/list?Order=title&Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/recipes/list so'rovimiz oxshamadi");
    }
  }

  Future<List<dynamic>> fetchCommunityRecipes({required String orderBy, required bool descending}) async {
    var response = await dio.get('/recipes/community/list?Order=$orderBy&Descending=$descending');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/recipes/community so'rovimizda xatolik!");
    }
  }

  Future<List<dynamic>> fetchTopChefsForHome({int? limit}) async {
    var response = await dio.get('/auth/top-chefs?Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/auth/top-chefs?Limit=4 so'rovimizda xatolik!");
    }
  }

  Future<List<dynamic>> fetchRecentlyAddedRecipes({int? limit}) async {
    final response = await dio.get('/recipes/list?Order=date&Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/recipes/list?Order=date&Limit=${limit ?? ''} so'rovimiz xato ketti!");
    }
  }

  Future<Map<String, dynamic>> fetchRecipeForReviews(int recipeId) async {
    var response = await dio.get('/recipes/reviews/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("/recipes/reviews/detail/$recipeId' so'rovimizda xatolik!");
    }
  }
}
