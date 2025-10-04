import 'package:dio/dio.dart';
import '../../../../../core/errors/exception/exception.dart';
import '../../../../../core/helper/dio_helper/api_end_ponit.dart';
import '../../../../../core/helper/dio_helper/dio_helper.dart';
import '../../domain/entity/sing_up_entity.dart';

class SingUpRemoteData {
  
  Future<Map<String,dynamic>> singUp({required SingUpEntity singUpEntity})async{
    try{
      final result = await DioHelper.postData(url:ApiEndPoint.register, data:{
        "name": singUpEntity.userName,
        "email":singUpEntity.email,
        "password":singUpEntity.password,
        "confirmPassword": singUpEntity.password
      });
      return result?.data;
    }catch (e){
      if (e is DioException){
        print("SignUp failed: ${e.message}");
        throw SingUpException(error: e.response?.data.values.first[0]);
      }else {
        throw ServerException();
      }
    }
  }
}