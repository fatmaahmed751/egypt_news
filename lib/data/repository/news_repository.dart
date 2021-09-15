import 'package:egypt_news/data/model/article_model.dart';
import 'package:egypt_news/data/remote_data_source/dio_helper.dart';

class NewsRepository {
  static Future<List<ArticleModel>> getNewsByCategory(String category) async {
    final res = await DioHelper.getNewsByCategory(category);
    List<ArticleModel> articles = NewsModel.fromJson(res.data).articles;
    return articles;
  }
}
