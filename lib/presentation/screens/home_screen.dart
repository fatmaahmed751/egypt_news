import 'package:egypt_news/presentation/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> _tabs = [
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
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
                  return Text('${index + 1}');
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(height: 16.0);
                },
                itemCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
