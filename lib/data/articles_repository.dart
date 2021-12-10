import 'dart:convert';
import 'package:news_flutter/data/dto/article_dto.dart';
import 'package:http/http.dart' as http;


abstract class ArticlesRepository {
  Future<List<ArticleDto>> getArticles();
}

class NetworkArticlesRepository extends ArticlesRepository {
  // TODO - inject api key + maybe url via DI
  static const String _serviceUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=7fa6727ed50442d48236c75e4f3e705c";

  @override
  Future<List<ArticleDto>> getArticles() async {
    http.Response result = await http.get(Uri.parse(_serviceUrl));

    if (result.statusCode == 200) {
      List<dynamic> articlesJson = jsonDecode(result.body)['articles'];
      return articlesJson.map((article) => ArticleDto.fromJson(article)).toList();
    } else {
      throw "Error occurred when fetching articles";
    }
  }
}
