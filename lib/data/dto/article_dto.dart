class ArticleDto {

  String? author;
  String title;
  String? description;
  String? urlToImage;
  String? content;
  String url;

  ArticleDto({
    this.author,
    required this.title,
    this.description,
    this.urlToImage,
    this.content,
    required this.url
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) {
    return ArticleDto(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        urlToImage: json['urlToImage'],
        content: json['content'],
        url: json['url']
    );
  }
}