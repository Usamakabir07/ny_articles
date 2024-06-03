import 'package:flutter/material.dart';
import 'package:ny_articles/view/articleDetail/article_detail_screen.dart';
import 'package:ny_articles/view/articles/articles_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final Widget view;

    Map args = {};
    if (settings.arguments != null) {
      args = settings.arguments as Map;
    }
    switch (settings.name) {
      case ArticlesScreen.routeName:
        view = const ArticlesScreen();
        break;
      case ArticleDetailScreen.routeName:
        view = ArticleDetailScreen(
            mostViewedArticleDetail: args["mostViewedArticleDetail"]);
        break;
      default:
        // If there is no such named route in the switch statement
        view = const ArticlesScreen();
    }
    return MaterialPageRoute(builder: (_) => view, settings: settings);
  }
}
