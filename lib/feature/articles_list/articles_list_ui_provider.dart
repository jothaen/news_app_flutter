import 'package:flutter/material.dart';
import 'package:news_flutter/feature/articles_list/articles_list_state.dart';

class ArticlesListUiProvider {
  Widget getPageLayout(ArticlesListBlocState state) {
    if (state is ArticlesLoadingState) {
      return const Text("Loading");
    } else if (state is ArticlesErrorState) {
      return const Text("Error");
    } else if (state is NoArticlesAvailableState) {
      return const Text("No articles");
    } else if (state is ArticlesLoadedState) {
      return Text("Articles counts: ${state.articles.length}");
    } else {
      return Text("");
    }
  }
}
