import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/base/base_page_state.dart';
import 'package:news_flutter/feature/article_details/article_details_cubit.dart';
import 'package:news_flutter/feature/article_details/article_details_state.dart';
import 'package:news_flutter/feature/article_details/article_details_ui_provider.dart';
import 'package:news_flutter/feature/articles_list/articles_list_state.dart';
import 'package:news_flutter/model/article.dart';

class ArticleDetailsPage extends StatefulWidget {
  final Article _article;

  ArticleDetailsPage(this._article);

  @override
  State<StatefulWidget> createState() => ArticleDetailsPageState();
}

class ArticleDetailsPageState extends BasePageState<ArticleDetailsCubit, ArticleDetailsPage>
    implements UiEventsListener {
  late final ArticleDetailsUiProvider _uiProvider;

  @override
  void initState() {
    _uiProvider = ArticleDetailsUiProvider(this);
    bloc.onScreenStart(widget._article);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<ArticleDetailsCubit, ArticleDetailsBlocState>(
      bloc: bloc, builder: (context, state) => _uiProvider.getPageLayout(state));

  @override
  void onReadFullArticleClick(String articleUrl) {
    // navigate to webview
  }
}

abstract class UiEventsListener {
  void onReadFullArticleClick(String articleUrl);
}
