import 'package:flutter/material.dart';
import 'package:ny_articles/view/articles/widgets/article_list_item.dart';
import 'package:ny_articles/viewModels/articles_view_model.dart';
import 'package:provider/provider.dart';

import '../../common/colors.dart';
import 'widgets/menu_button.dart';

class ArticlesScreen extends StatefulWidget {
  static const routeName = '/articles-screen';
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    Provider.of<ArticlesViewModel>(context, listen: false)
        .getArticles(duration: '7');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.foregroundColor,
        leading: Icon(
          Icons.menu_rounded,
          color: MyColors.white,
        ),
        title: Text(
          "NY Times Most Popular",
          style: TextStyle(
            fontSize: 18,
            color: MyColors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.search_rounded,
            color: MyColors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          const MenuButton(),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, _) {
          return viewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => viewModel.refreshArticles(duration: "7"),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: viewModel.mostViewedArticles.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ArticleTile(
                              mostViewedArticle:
                                  viewModel.mostViewedArticles[index],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
