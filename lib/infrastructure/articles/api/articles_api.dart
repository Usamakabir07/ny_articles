import 'package:dio/dio.dart';

import '../../apiUtil/urls.dart';

class GetArticlesApi {
  GetArticlesApi({required this.dio});

  final Dio dio;

  Future<dynamic> getArticles({
    required String duration,
  }) async {
    Response response = await dio.get(
      duration + Urls.apiKey,
    );
    return response;
  }
}
