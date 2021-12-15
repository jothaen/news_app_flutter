import 'package:news_flutter/model/article.dart';

abstract class ArticleDetailsBlocState {}

class IdleState extends ArticleDetailsBlocState {}

class ArticleLoadedState extends ArticleDetailsBlocState {
  final Article article;

  ArticleLoadedState(this.article);
}