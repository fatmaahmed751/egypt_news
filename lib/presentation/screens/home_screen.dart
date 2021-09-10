import 'package:egypt_news/data/model/article_model.dart';
import 'package:egypt_news/presentation/widgets/article_item.dart';
import 'package:egypt_news/presentation/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> _tabs = const [
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

   final List<ArticleModel> articles = [
     ArticleModel(
       urlToImage: 'https://cdni.rt.com/media/pics/2021.09/original/613b2fb74c59b70c7864d7e3.jpg',
       title: 'Lorem Ipsum',
       description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
       publishedAt: '12/5/2021',
     ),
     ArticleModel(
       urlToImage: 'https://media.gemini.media/img/large/2021/9/10/2021_9_10_11_44_42_468.jpg',
       title: 'Lorem Ipsum',
       description: "has survived not only five centuries",
       publishedAt: '12/5/2021',
     ),
     ArticleModel(
       urlToImage: 'https://media.gemini.media/img/large/2021/7/29/2021_7_29_20_53_55_629.jpg',
       title: 'Lorem Ipsum',
       description: "Subscribe to The Australian to get unrestricted digital access, home paper delivery, Apps for iPad and Android, member only +Rewards and much more...",
       publishedAt: '12/5/2021',
     ),
     ArticleModel(
       urlToImage: 'https://media.gemini.media/img/large/2021/1/29/2021_1_29_1_59_27_187.jpg',
       title: 'Lorem Ipsum',
       description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
       publishedAt: '12/5/2021',
     ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egypt News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'News from all over Egypt',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 16.0),
            TabBarWidget(
              tabs: _tabs,
              onTap: (index) {
                print('you just tapped $index');
                // TODO: implement news filtration function
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return ArticleItem(article: articles[index]);
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(height: 16.0);
                },
                itemCount: articles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
