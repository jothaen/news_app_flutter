import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/feature/articles_list/articles_list_state.dart';
import 'package:news_flutter/model/article.dart';
import 'package:news_flutter/usecase/fetch_articles_use_case.dart';

class ArticlesListPageCubit extends Cubit<ArticlesListBlocState> {
  final FetchArticlesUseCase _fetchArticlesUseCase;

  ArticlesListPageCubit(this._fetchArticlesUseCase) : super(IdleState());

  void onScreenStart() async {
    _fetchArticles();
  }

  void onRetryClick() async {
    _fetchArticles();
  }

  void onPullToRefresh() async {
    _fetchArticles();
  }

  void _fetchArticles() async {
    emit(ArticlesLoadingState());
    try {
      List<Article> result = await _fetchArticlesUseCase.fetch();
      _handleSuccessResult(result);
    } catch (e) {
      emit(ArticlesErrorState());
    }
  }

  void _handleSuccessResult(List<Article> result) {
    if (result.isEmpty) {
      emit(NoArticlesAvailableState());
    } else {
      emit(ArticlesLoadedState(result));
    }
  }
}
