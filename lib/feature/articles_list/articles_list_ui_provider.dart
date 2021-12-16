import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/feature/articles_list/articles_list_page.dart';
import 'package:news_flutter/feature/articles_list/articles_list_state.dart';
import 'package:news_flutter/model/article.dart';
import 'package:news_flutter/widget/common_widgets.dart';

class ArticlesListUiProvider {
  final UiEventsListener _uiEventsListener;

  ArticlesListUiProvider(this._uiEventsListener);

  Widget getPageLayout(ArticlesListBlocState state) => Scaffold(appBar: _getAppBar(), body: _getBody(state));

  PreferredSizeWidget _getAppBar() => AppBar(elevation: 0, centerTitle: false, title: const Text("News"));

  Widget? _getBody(ArticlesListBlocState state) {
    if (state is ArticlesLoadingState) {
      return CommonWidgets.circularProgress();
    } else if (state is ArticlesErrorState) {
      return _getErrorBody();
    } else if (state is NoArticlesAvailableState) {
      return _getNoArticlesBody();
    } else if (state is ArticlesLoadedState) {
      return _getListOfArticlesBody(state.articles);
    }
  }

  Widget _getErrorBody() => Column(
        children: const [
          Text("Something went wrong :("),
          // TODO add button
        ],
      );

  Widget _getNoArticlesBody() => const Center(child: Text("There are no articles available"));

  Widget _getListOfArticlesBody(List<Article> articles) => RefreshIndicator(
        onRefresh: () => _uiEventsListener.onPullToRefresh(),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: articles.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              Article item = articles[index];
              return Card(
                child: ListTile(
                    onTap: () {
                      _uiEventsListener.onArticleClick(item);
                    },
                    title: _getTitleAndImage(item),
                    subtitle: item.description.isNotEmpty ? Text(item.description) : null),
              );
            }),
      );

  Widget _getTitleAndImage(Article item) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Text(item.title),
            flex: 6,
          ),
          Expanded(
            child: item.imageUrl.isNotEmpty ? Image.network(item.imageUrl) : Container(),
            flex: 4,
          ),
        ]),
      );
}
