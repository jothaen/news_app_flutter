import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/feature/articles_list/articles_list_page.dart';
import 'package:news_flutter/feature/articles_list/articles_list_state.dart';
import 'package:news_flutter/model/article.dart';
import 'package:news_flutter/widget/common_widgets.dart';

class ArticlesListUiProvider {
  final UiEventsListener _uiEventsListener;

  ArticlesListUiProvider(this._uiEventsListener);

  Widget getPageLayout(ArticlesListBlocState state) =>
      Scaffold(body: SafeArea(child: _getBody(state)));

  Widget _getBody(ArticlesListBlocState state) {
    if (state is ArticlesLoadingState) {
      return CommonWidgets.circularProgress();
    } else if (state is ArticlesErrorState) {
      return _getErrorBody();
    } else if (state is NoArticlesAvailableState) {
      return _getNoArticlesBody();
    } else if (state is ArticlesLoadedState) {
      return _getListOfArticlesBody(state.articles);
    } else {
      return Container();
    }
  }

  Widget _getErrorBody() => Column(
        children: const [
          Text("Something went wrong :("),
          // TODO add button
        ],
      );

  Widget _getNoArticlesBody() =>
      const Center(child: Text("There are no articles available"));

  Widget _getListOfArticlesBody(List<Article> articles) => RefreshIndicator(
        onRefresh: () => _uiEventsListener.onPullToRefresh(),
        child: ListView.builder(
            itemCount: articles.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              Article item = articles[index];
              return Card(
                margin: const EdgeInsets.all(8),
                elevation: 12,
                shape: const Border(),
                child: ListTile(
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    _uiEventsListener.onArticleClick(item);
                  },
                  title: _getImage(item.imageUrl),
                  subtitle: _getTitleAndAuthor(item.title, item.author),
                ),
              );
            }),
      );

  Widget _getTitleAndAuthor(String title, String author) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  author,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                )),
          ],
        ),
      );

  Widget _getImage(String imageUrl) => Hero(
        tag: imageUrl,
        child: Image.network(
          imageUrl,
          height: 160,
          fit: BoxFit.cover,
        ),
      );
}
