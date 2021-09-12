import 'package:egypt_news/constants/app_constants.dart';
import 'package:egypt_news/data/model/article_model.dart';
import 'package:egypt_news/presentation/routing/slide_vertical_page_route_builder.dart';
import 'package:egypt_news/presentation/screens/home_screen.dart';
import 'package:egypt_news/presentation/screens/news_details_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.INITIAL_ROUTE:
        return SlideVerticalPageRouteBuilder(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      case AppConstants.NEWS_DETAILS_ROUTE:
        final article = settings.arguments as ArticleModel;
        return SlideVerticalPageRouteBuilder(
          builder: (_) => NewsDetailsScreen(article: article),
          settings: settings,
        );
    }
  }
}
