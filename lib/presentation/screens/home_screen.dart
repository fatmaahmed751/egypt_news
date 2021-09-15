import 'package:egypt_news/business_logic/cubit/news_cubit/news_cubit.dart';
import 'package:egypt_news/business_logic/cubit/news_cubit/news_states.dart';
import 'package:egypt_news/presentation/widgets/article_item.dart';
import 'package:egypt_news/presentation/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> _categories = const [
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (BuildContext context) => NewsCubit()..getArticlesByCategory(_categories[0]),
      child: BlocBuilder<NewsCubit, NewsStates>(
        builder: (context, state) {
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
                    tabs: _categories,
                    onTap: (index) {
                      context.read<NewsCubit>().getArticlesByCategory(_categories[index]);
                    },
                  ),
                  const SizedBox(height: 16.0),
                  if (state is NewsGetArticlesSuccessState)
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        itemBuilder: (_, index) {
                          return ArticleItem(article: state.articles[index]);
                        },
                        separatorBuilder: (_, index) {
                          return const SizedBox(height: 16.0);
                        },
                        itemCount: state.articles.length,
                      ),
                    ),
                  if (state is NewsGetArticlesErrorState)
                    Center(
                      child: Text(state.error),
                    ),
                  if (state is NewsGetLoadingState)
                    const Expanded(
                      child: const Center(
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
