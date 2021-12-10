import 'package:news_flutter/model/article.dart';

abstract class ArticlesListBlocState {}

class IdleState extends ArticlesListBlocState {}

class ArticlesErrorState extends ArticlesListBlocState {}

class ArticlesLoadingState extends ArticlesListBlocState {}

class NoArticlesAvailableState extends ArticlesListBlocState {}

class ArticlesLoadedState extends ArticlesListBlocState {

  final List<Article> articles;

  ArticlesLoadedState(this.articles);

}