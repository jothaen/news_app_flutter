import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/base/base_page_state.dart';
import 'package:news_flutter/feature/article_details/article_details_page.dart';
import 'package:news_flutter/feature/articles_list/articles_list_cubit.dart';
import 'package:news_flutter/feature/articles_list/articles_list_state.dart';
import 'package:news_flutter/model/article.dart';

import 'articles_list_ui_provider.dart';

class ArticlesListPage extends StatefulWidget {
  const ArticlesListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ArticlesListPageState();
}

class ArticlesListPageState extends BasePageState<ArticlesListPageCubit, ArticlesListPage> implements UiEventsListener {
  late ArticlesListUiProvider _uiProvider;

  @override
  void initState() {
    _uiProvider = ArticlesListUiProvider(this);
    bloc.onScreenStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<ArticlesListPageCubit, ArticlesListBlocState>(
      bloc: bloc, builder: (context, state) => _uiProvider.getPageLayout(state));

  @override
  void onArticleClick(Article article) {
    _navigateToArticleDetails(article);
  }

  @override
  Future<void> onPullToRefresh() async {
    bloc.onPullToRefresh();
  }

  @override
  void onRetryClick() {
    bloc.onRetryClick();
  }

  void _navigateToArticleDetails(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleDetailsPage(article)));
  }
}

abstract class UiEventsListener {
  void onArticleClick(Article article);

  Future<void> onPullToRefresh();

  void onRetryClick();
}
