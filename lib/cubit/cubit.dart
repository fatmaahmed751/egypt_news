import 'package:bloc/bloc.dart';
import 'package:egypt_news/cubit/states.dart';
import 'package:egypt_news/data/model/article_model.dart';
import 'package:egypt_news/data/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>{

NewsCubit():super(NewsInitialState());

static NewsCubit get(context)=>BlocProvider.of(context);


void getBusiness({
  required String category,
}){
  DioHelper.getData(
  category: category,
  ).then((value) {
    print('errrrrrrrrrrrrrrrrror');
    print(value);
    List<ArticleModel>?articles=NewsModel.fromJson(value.data).articles;

    emit(NewsGetArticlesSuccessState(articles!));
  }).catchError((error){
    print(error.toString());
    emit(NewsGetArticlesErrorState(error.toString()));
  });
}
}