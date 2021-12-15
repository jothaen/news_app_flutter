import 'package:flutter/material.dart';
import 'package:news_flutter/feature/article_details/article_details_state.dart';

import 'article_details_page.dart';

class ArticleDetailsUiProvider {

  final UiEventsListener _listener;

  ArticleDetailsUiProvider(this._listener);

  Widget getPageLayout(ArticleDetailsBlocState state) => Scaffold(appBar: _getAppBar(state), body: _getBody(state));

  PreferredSizeWidget _getAppBar(ArticleDetailsBlocState state) {
    var title = state is ArticleLoadedState ? state.article.title : "Article details";
    return AppBar(elevation: 0, centerTitle: false, title: Text(title));
  }

  Widget? _getBody(ArticleDetailsBlocState state) {
    if (state is ArticleLoadedState) {
      return SingleChildScrollView(child: Column(children: [
        _getImageViewIfNeeded(state.article.imageUrl),
        _getDescription(state.article.description),
        _getContent(state.article.content),
        _getReadAllButton()
      ]));
    }
  }

  Widget _getImageViewIfNeeded(String imageUrl) => imageUrl.isNotEmpty ? Image.network(imageUrl) : Container();

  Widget _getDescription(String description) => Text(description);

  Widget _getContent(String content) => Text(content);

  Widget _getReadAllButton() =>
      OutlinedButton(onPressed: () {
        _listener.onReadFullArticleClick();
      }, child: const Text("Read full article"));
}
