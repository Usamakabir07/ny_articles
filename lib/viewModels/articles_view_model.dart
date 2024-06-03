import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ny_articles/utils/global_functions.dart';
import 'package:ny_articles/utils/navigation_service.dart';

import '../infrastructure/articles/model/articles_model.dart';
import '../infrastructure/catalog_facade_service.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesViewModel({
    required this.catalogFacadeService,
  });

  final CatalogFacadeService catalogFacadeService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<MostViewedArticle> _mostViewedArticles = [];
  List<MostViewedArticle> get mostViewedArticles => _mostViewedArticles;

  Future<void> getArticles({required String duration}) async {
    _isLoading = true;
    try {
      final res = await catalogFacadeService.getArticles(
        duration: duration,
      );
      _mostViewedArticles = res.data!;
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      showToast(
        message: "something went wrong\n$e",
        context: NavigationService.navigatorKey.currentContext!,
      );
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshArticles({required String duration}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final res = await catalogFacadeService.getArticles(
        duration: duration,
      );
      _mostViewedArticles = res.data!;
      notifyListeners();
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      showToast(
        message: "something went wrong\n$e",
        context: NavigationService.navigatorKey.currentContext!,
      );
    }
    _isLoading = false;
    notifyListeners();
  }
}
