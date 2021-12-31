import 'package:flutter/material.dart';
import 'package:news_flutter/feature/article_details/article_details_state.dart';

import 'article_details_page.dart';

class ArticleDetailsUiProvider {
  final UiEventsListener _listener;

  ArticleDetailsUiProvider(this._listener);

  Widget getPageLayout(ArticleDetailsBlocState state) =>
      Scaffold(appBar: _getAppBar(), body: _getBody(state));

  PreferredSizeWidget _getAppBar() => AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: const Text("Article details"));

  Widget? _getBody(ArticleDetailsBlocState state) {
    if (state is ArticleLoadedState) {
      return SingleChildScrollView(
          child: Column(children: [
        _getImageViewIfNeeded(state.article.imageUrl),
        _getTitle(state.article.title),
        Align(
            child: _getAuthor(state.article.author),
            alignment: Alignment.centerRight),
        _getDescription(state.article.description),
        _getContent(state.article.content),
        _getReadAllButton(state.article.fullArticleUrl)
      ]));
    }
  }

  Widget _getImageViewIfNeeded(String imageUrl) => imageUrl.isNotEmpty
      ? Hero(tag: imageUrl, child: Image.network(imageUrl))
      : Container();

  Widget _getTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Text(title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
      );

  Widget _getAuthor(String author) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Text(
          author,
          textAlign: TextAlign.end,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      );

  Widget _getDescription(String description) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Text(description),
      );

  Widget _getContent(String content) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Text(content),
      );

  Widget _getReadAllButton(String articleUrl) => OutlinedButton(
      onPressed: () {
        _listener.onReadFullArticleClick(articleUrl);
      },
      child: const Text("Read full article"));
}
