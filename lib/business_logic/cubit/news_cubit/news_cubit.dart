import 'package:bloc/bloc.dart';
import 'package:egypt_news/business_logic/cubit/news_cubit/news_states.dart';
import 'package:egypt_news/data/model/article_model.dart';
import 'package:egypt_news/data/remote_data_source/dio_helper.dart';
import 'package:egypt_news/data/repository/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  void getArticlesByCategory(String category) {
    emit(NewsGetLoadingState());

    NewsRepository.getNewsByCategory(category).then((articles) {
      emit(NewsGetArticlesSuccessState(articles));
    }).catchError((error) {
      emit(NewsGetArticlesErrorState(error.toString()));
    });
  }
}
