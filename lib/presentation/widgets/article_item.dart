import 'package:cached_network_image/cached_network_image.dart';
import 'package:egypt_news/constants/app_constants.dart';
import 'package:egypt_news/data/model/article_model.dart';
import 'package:timeago/timeago.dart' as timeago;
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
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) => Container(
                  width: 56.0,
                  height: 56.0,
                  color: Colors.grey[300],
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article.title ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        article.timeAgo,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                              color: Colors.grey[700],
                            ),
                      ),
                      const SizedBox(width: 4.0),
                      const Icon(
                        Icons.date_range,
                        size: 14.0,
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
