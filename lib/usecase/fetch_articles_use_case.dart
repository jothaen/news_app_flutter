import 'package:news_flutter/data/articles_repository.dart';
import 'package:news_flutter/data/dto/article_dto.dart';
import 'package:news_flutter/model/article.dart';

class FetchArticlesUseCase {

  final ArticlesRepository _repository;

  FetchArticlesUseCase(this._repository);

  Future<List<Article>> fetch() async {
    List<ArticleDto> apiCallResult = await _repository.getArticles();
    return apiCallResult.map((e) => Article.fromDto(e)).toList();
  }

}