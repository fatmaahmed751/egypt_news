import 'package:timeago/timeago.dart' as timeago;

class NewsModel {
  String? status;
  int? totalResults;
  late List<ArticleModel> articles;

  NewsModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles = [];
    json['articles'].forEach((v) {
      articles.add(ArticleModel.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    map['articles'] = articles.map((v) => v.toJson()).toList();
    return map;
  }
}

class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  String get timeAgo {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    return timeago.format(DateTime.parse(publishedAt ?? ''), locale: 'ar');
  }

  ArticleModel.fromJson(dynamic json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
