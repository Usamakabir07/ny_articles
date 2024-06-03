import 'package:flutter/material.dart';
import 'package:ny_articles/infrastructure/articles/model/articles_model.dart';

import '../../common/article_network_image.dart';
import '../../common/colors.dart';
import '../../utils/global_functions.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const routeName = '/article-detail';
  const ArticleDetailScreen({
    super.key,
    required this.mostViewedArticleDetail,
  });
  final MostViewedArticle mostViewedArticleDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.white),
        backgroundColor: MyColors.foregroundColor,
        title: Text(
          "Article Detail",
          style: TextStyle(
            fontSize: 18,
            color: MyColors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: kHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          width: kWidth,
          child: ListView(
            children: [
              Text(
                mostViewedArticleDetail.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: MyColors.subtitleColor,
                    size: 16,
                  ),
                  Text(
                    ' ${mostViewedArticleDetail.updated.toString().split(" ")[0]}',
                    style: TextStyle(
                      color: MyColors.subtitleColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.watch_later_outlined,
                    color: MyColors.subtitleColor,
                    size: 16,
                  ),
                  Text(
                    mostViewedArticleDetail.updated
                        .toString()
                        .split(" ")[1]
                        .split(".")[0],
                    style: TextStyle(
                      color: MyColors.subtitleColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: mostViewedArticleDetail.media.isEmpty
                        ? CircleAvatar(
                            radius: 20,
                            backgroundColor: MyColors.subtitleColor,
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              color: MyColors.white,
                            ),
                          )
                        : NetworkImageForArticles(
                            imageUrl: mostViewedArticleDetail
                                .media.first.mediaMetadata.first.url,
                            radius: 15,
                          ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 9,
                    child: Text(
                      mostViewedArticleDetail.byline,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.subtitleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 0.5,
              ),
              if (mostViewedArticleDetail.media.isNotEmpty &&
                  mostViewedArticleDetail.media.first.caption.isNotEmpty)
                const Text(
                  'Caption',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (mostViewedArticleDetail.media.isNotEmpty &&
                  mostViewedArticleDetail.media.first.caption.isNotEmpty)
                const SizedBox(
                  height: 5,
                ),
              if (mostViewedArticleDetail.media.isNotEmpty &&
                  mostViewedArticleDetail.media.first.caption.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    mostViewedArticleDetail.media.first.caption,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              if (mostViewedArticleDetail.media.isNotEmpty &&
                  mostViewedArticleDetail.media.first.caption.isNotEmpty)
                const Divider(
                  thickness: 0.5,
                ),
              const Text(
                'Abstract',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '"${mostViewedArticleDetail.mostViewedArticleModelAbstract} "',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
              ),
              const Text(
                'Published date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                mostViewedArticleDetail.publishedDate.toString().split(" ")[0],
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Source',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                mostViewedArticleDetail.source,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Section',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                mostViewedArticleDetail.section,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              if (mostViewedArticleDetail.subsection.isNotEmpty)
                const SizedBox(
                  height: 5,
                ),
              if (mostViewedArticleDetail.subsection.isNotEmpty)
                const Text(
                  'Sub-section',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              if (mostViewedArticleDetail.subsection.isNotEmpty)
                Text(
                  mostViewedArticleDetail.subsection,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Keywords',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              for (var item in mostViewedArticleDetail.desFacet)
                Text(
                  item,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
