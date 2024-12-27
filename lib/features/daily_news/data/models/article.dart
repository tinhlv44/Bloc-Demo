// Model class
import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntities {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? " ",
      title: map['title'] ?? " ",
      description: map['description'] ?? " ",
      url: map['url'] ?? " ",
      urlToImage: map['urlToImage'] ??
          "https://th.bing.com/th/id/OIP.8FRBs3nSEcnmSNDn3YnSmAHaHa?rs=1&pid=ImgDetMain",
      publishedAt: map['publishedAt'] ?? " ",
      content: map['content'] ?? " ",
    );
  }
  factory ArticleModel.fromEntity(ArticleEntities entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.url,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}
