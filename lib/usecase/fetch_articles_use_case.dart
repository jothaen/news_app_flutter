import 'package:news_flutter/data/articles_repository.dart';
import 'package:news_flutter/data/dto/article_dto.dart';
import 'package:news_flutter/model/article.dart';

class FetchArticlesUseCase {
  final ArticlesRepository _repository;

  FetchArticlesUseCase(this._repository);

  Future<List<Article>> fetch() async {
    List<ArticleDto> apiCallResult = await _repository.getArticles();
    List<ArticleDto> validArticles = apiCallResult.where((element) => _validateArticle(element)).toList();

    return validArticles.map((e) => Article.fromDto(e)).toList();
  }

  bool _validateArticle(ArticleDto articleDto) =>
      articleDto.author != null &&
      articleDto.urlToImage != null &&
      articleDto.description != null &&
      articleDto.content != null;
}
