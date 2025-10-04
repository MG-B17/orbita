
import 'package:dio/dio.dart';

import 'api_end_ponit.dart';

class DioHelper {

 static  Dio? dio ;

  static void initialDio (){
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoint.baseUrl,
        receiveTimeout:const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveDataWhenStatusError: true,
          headers:{
          'Content-Type': 'application/json',
          'accept': '*/*'
        }
      )
    );
  }

 static Future<Response?> getData ({required String url,Map<String,dynamic>? data,Map<String,dynamic>? query,Map<String,dynamic>? headers})async{
    return await dio?.get(url,data: data,queryParameters:query,options:Options(headers:headers));
  }

 static Future<Response?> postData ({required String url , Map<String,dynamic>? query, Map<String,dynamic>? data,Map<String,dynamic>? headers})async{
    return await dio?.post(url,data: data,queryParameters:query,options:Options(headers:headers));
  }

 static Future putData ({required String url ,required  data,Map<String,dynamic>? headers})async{
    return await dio?.put(url,data: data,options: Options(headers:headers));
  }

 static Future deleteData ({required String url ,required Map<String,dynamic> data,})async{
    return await dio?.delete(url,data: data);
  }
}