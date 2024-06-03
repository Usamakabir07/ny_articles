import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../apiUtil/urls.dart';

class GetArticlesApi {
  GetArticlesApi({required this.dio});

  final Dio dio;

  Future<dynamic> getArticles({
    required String duration,
  }) async {
    Response response = await dio.get(
      duration + dotenv.env['NY_API_KEY']!,
    );
    return response;
  }
}
