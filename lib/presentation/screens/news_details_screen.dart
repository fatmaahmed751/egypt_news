import 'package:egypt_news/data/model/article_model.dart';
import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  final ArticleModel article;
  const NewsDetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egypt News'),
      ),
      body: Center(
        child: Text('${article.title}'),
      ),
    );
  }
}
