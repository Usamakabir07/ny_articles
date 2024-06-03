import '../apiUtil/response_wrappers.dart';
import 'model/articles_model.dart';

abstract class ArticlesInterface {
  Future<ResponseWrapper<List<MostViewedArticle>>> getArticles({
    required String duration,
  });
}
