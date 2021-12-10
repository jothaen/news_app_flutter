import 'package:news_flutter/data/dto/article_dto.dart';

class Article {

  final String author;
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String fullArticleUrl;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content,
    required this.fullArticleUrl
  });

  factory Article.fromDto(ArticleDto dto) {
    return Article(
      author: dto.author ?? "",
      title: dto.title,
      description: dto.description ?? "",
      imageUrl: dto.urlToImage ?? "",
      content: dto.content ?? "",
      fullArticleUrl: dto.url
    );
  }

}