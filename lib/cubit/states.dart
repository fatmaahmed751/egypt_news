import 'package:egypt_news/data/model/article_model.dart';

abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsGetArticlesSuccessState extends NewsStates{
  final List<ArticleModel>articles;
  NewsGetArticlesSuccessState(this.articles);
}

class NewsGetLoadingState extends NewsStates{}

class NewsGetArticlesErrorState extends NewsStates{
  final String error;

  NewsGetArticlesErrorState(this.error);
}