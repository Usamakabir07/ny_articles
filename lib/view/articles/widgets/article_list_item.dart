import 'package:flutter/material.dart';
import 'package:ny_articles/infrastructure/articles/model/articles_model.dart';

import '../../../common/article_network_image.dart';
import '../../../common/colors.dart';
import '../../articleDetail/article_detail_screen.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({super.key, required this.mostViewedArticle});
  final MostViewedArticle mostViewedArticle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minVerticalPadding: 10,
          onTap: () {
            Navigator.pushNamed(context, ArticleDetailScreen.routeName,
                arguments: {"mostViewedArticleDetail": mostViewedArticle});
          },
          leading: NetworkImageForArticles(
            imageUrl: mostViewedArticle.media.isNotEmpty
                ? mostViewedArticle.media.first.mediaMetadata.first.url
                : "",
            radius: 20,
          ),
          title: Text(
            mostViewedArticle.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: MyColors.titleColor,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  mostViewedArticle.byline,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: MyColors.subtitleColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      color: MyColors.subtitleColor,
                      size: 18,
                    ),
                    Text(
                      "${mostViewedArticle.publishedDate.year}-${mostViewedArticle.publishedDate.month}-${mostViewedArticle.publishedDate.day}",
                      style: TextStyle(
                        fontSize: 12,
                        color: MyColors.subtitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          ),
          horizontalTitleGap: 10,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        const Divider(
          thickness: 0.5,
          height: 2,
        ),
      ],
    );
  }
}
