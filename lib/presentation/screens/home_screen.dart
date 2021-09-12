import 'package:egypt_news/cubit/cubit.dart';
import 'package:egypt_news/cubit/states.dart';
import 'package:egypt_news/data/model/article_model.dart';
import 'package:egypt_news/data/remote/dio_helper.dart';
import 'package:egypt_news/presentation/widgets/article_item.dart';
import 'package:egypt_news/presentation/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// routing
// bloc
// api
// news details


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<String> _tabs = [
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
    create: (BuildContext context)=>NewsCubit()..getBusiness(category:_tabs[0]),
     child:Scaffold(
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
                   tabs:_tabs,
                   onTap: (index) {
                     NewsCubit.get(context).getBusiness(category: _tabs[index]);
                     print('you just tapped $index');
                     // TODO: implement news filtration function
                   },
                 ),
                 const SizedBox(height: 16.0),
                 BlocBuilder<NewsCubit,NewsStates>(
                   builder: (context, state) {
                     if( state is NewsGetArticlesSuccessState){
                         return Expanded(
                           child: ListView.separated(
                             physics: const BouncingScrollPhysics(),
                             itemBuilder: (_, index) {
                               return ArticleItem(article:state.articles[index]);
                             },
                             separatorBuilder: (_, index) {
                               return const SizedBox(height: 16.0);
                             },
                             itemCount: state.articles.length,
                           ),
                         );
                       }
                   if(state is NewsGetArticlesErrorState ) {
                     return Center(
                       child: Text(state.error),
                     );
                   }
                     return  const Center(
                       child: const CircularProgressIndicator(),
                     );

              },
               ),
               ],
             ),
           ),
     ),
     );

  }
}
