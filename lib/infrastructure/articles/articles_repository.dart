import 'package:dio/dio.dart';
import 'package:ny_articles/infrastructure/articles/api/articles_api.dart';
import 'package:ny_articles/infrastructure/articles/articles_interface.dart';
import '../apiUtil/response_wrappers.dart';
import 'model/articles_model.dart';

class ArticlesRepository implements ArticlesInterface {
  ArticlesRepository({required this.articlesApi});
  final GetArticlesApi articlesApi;

  @override
  Future<ResponseWrapper<List<MostViewedArticle>>> getArticles({
    required String duration,
  }) async {
    Response response = await articlesApi.getArticles(
      duration: duration,
    );
    var res = ResponseWrapper<List<MostViewedArticle>>();
    res.data = (response.data["results"] as List)
        .map<MostViewedArticle>((json) => MostViewedArticle.fromJson(json))
        .toList();
    return res;
  }
}
