import 'package:dio/dio.dart';
import 'package:egypt_news/constants/api_constants.dart';

class DioHelper{
   static Dio? dio;

static init()
{
   dio=Dio(
     BaseOptions(
       baseUrl: ApiConstants.BASE_URL,
       receiveDataWhenStatusError:true ,
       receiveTimeout:20*1000 ,

     ),
   );
}

 static Future<Response> getData({
  required String category ,
})async
 {
   var query ={
     'country':'eg',
     'category':category,
     'apiKey':'77ef2ede7d4c4255a48ef0c8ce9d93a7',
   };
 return await dio!.get(ApiConstants.TOP_HEADLINES,queryParameters:query);
 }

}