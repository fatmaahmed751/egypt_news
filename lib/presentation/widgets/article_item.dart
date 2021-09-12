import 'package:egypt_news/constants/app_constants.dart';
import 'package:egypt_news/data/model/article_model.dart';
import 'package:egypt_news/presentation/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;

  ArticleItem({required this.article});

  void _navigateToDetailsScreen(BuildContext context) {
    Navigator.pushNamed(context, AppConstants.NEWS_DETAILS_ROUTE, arguments: article);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetailsScreen(context),
      child: Container(
        height: 110,
        child: Row(
          children: [
            Container(
              width: 110.0,
              height: 110.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  NetworkImage(
                    article.urlToImage ?? '',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? '',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.PRIMARY,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      article.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 14.0,
                          color: Colors.deepOrange,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          article.publishedAt ?? '',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      );

  }
}
