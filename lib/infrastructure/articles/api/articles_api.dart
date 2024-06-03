import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetArticlesApi {
  GetArticlesApi({required this.dio});

  final Dio dio;

  Future<dynamic> getArticles({
    required String duration,
  }) async {
    //using .env file to access the API key in order to maintain the security
    //But adding it in the project files so that app can fetch the response
    Response response = await dio.get(
      duration + dotenv.env['NY_API_KEY']!,
    );
    return response;
  }
}
