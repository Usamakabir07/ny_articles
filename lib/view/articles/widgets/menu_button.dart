import 'package:flutter/material.dart';
import 'package:ny_articles/viewModels/articles_view_model.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesViewModel>(builder: (context, viewModel, _) {
      return PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 0,
            onTap: () => viewModel.refreshArticles(duration: '1'),
            child: const Text("1 Day"),
          ),
          PopupMenuItem(
            value: 1,
            onTap: () => viewModel.refreshArticles(duration: '7'),
            child: const Text("7 Days"),
          ),
          PopupMenuItem(
            value: 2,
            onTap: () => viewModel.refreshArticles(duration: '30'),
            child: const Text("30 Days"),
          ),
        ],
        child: Icon(
          Icons.more_vert,
          color: MyColors.white,
        ),
      );
    });
  }
}
