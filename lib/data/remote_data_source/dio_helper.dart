import 'package:dio/dio.dart';
import 'package:egypt_news/constants/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: ApiConstants.BASE_URL,
          receiveDataWhenStatusError: true,
          receiveTimeout: 20 * 1000,
          queryParameters: {
            'country': 'eg',
            'apiKey': ApiConstants.API_KEY,
          }),
    );
  }

  static Future<Response> getNewsByCategory(String category) async {
    Response res = await dio.get(
      ApiConstants.TOP_HEADLINES,
      queryParameters: {'category': category},
    );

    return res;
  }
}
