import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/base/base_page_state.dart';
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
  Widget build(BuildContext context) => BlocListener(
      bloc: bloc,
      child: BlocBuilder<ArticlesListPageCubit, ArticlesListBlocState>(
          bloc: bloc, builder: (context, state) => _uiProvider.getPageLayout(state)),
      listener: (context, state) {
        // TODO - navigation (?)
      });

  @override
  void onArticleClick(Article article) {
    // TODO: implement onArticleClick
  }

  @override
  Future<void> onPullToRefresh() async {
    bloc.onPullToRefresh();
  }

  @override
  void onRetryClick() {
    bloc.onRetryClick();
  }
}

abstract class UiEventsListener {
  void onArticleClick(Article article);

  Future<void> onPullToRefresh();

  void onRetryClick();
}
