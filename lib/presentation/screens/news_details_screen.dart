import 'package:egypt_news/data/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsScreen extends StatelessWidget {
  final ArticleModel article;
  const NewsDetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: WebView(
      initialUrl: article.url,
    ),
    );
  }
}
