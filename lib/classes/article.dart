import 'dart:convert';

import 'package:http/http.dart' as http;





class Article {
  String source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(
      {this.source,
        this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['source']['name'] as String,
        author: json['author'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] as String,
        content: json['content'] as String);
  }

  factory Article.fromJson2(Map<String, dynamic> json) {
    return Article(
        author: json['author'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] as String,
        content: json['content'] as String);
  }


  Future<List<Article>> getArticleList () async{
    var url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=6e60e7da8b234bde89a128dc55f3ad18';
    var response = await http.get(url);
    final body = jsonDecode(response.body)['articles'] as List;
    return body.map((json) => Article.fromJson(json)).toList();
  }


}
