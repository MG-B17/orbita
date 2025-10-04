import 'package:dio/dio.dart';
import '../../../../../core/errors/exception/exception.dart';
import '../../../../../core/helper/dio_helper/api_end_ponit.dart';
import '../../../../../core/helper/dio_helper/dio_helper.dart';
import '../../../../../core/helper/local_data_helper/cache_helper.dart';
import '../../../../../core/helper/local_data_helper/local_data_keys.dart';
import '../../../../../core/utils/variable/variables.dart';
import '../../domain/entity/login_entity.dart';


class LoginRemoteData {

  Future<Map<String,dynamic>>login({required LoginEntity loginEntity})async{
    try{
     final result =  await DioHelper.postData(url: ApiEndPoint.login, data:{
        "email":loginEntity.userName,
        "password":loginEntity.password,
      });
     CacheHelper.setStringData(key: LocalDataKeys.token, value: result?.data["token"]);
     Variables.token =result?.data["token"];
     return result?.data;
    }catch (e){
      print(e.toString());
      if (e is DioException){
        throw LoginException(error: e.response?.data["message"]);
      }else {
        throw ServerException();
      }
    }
  }
}