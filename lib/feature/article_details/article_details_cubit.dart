
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/feature/article_details/article_details_state.dart';
import 'package:news_flutter/model/article.dart';

class ArticleDetailsCubit extends Cubit<ArticleDetailsBlocState> {

  ArticleDetailsCubit() : super(IdleState());

  void onScreenStart(Article article) {
    emit(ArticleLoadedState(article));
  }
}