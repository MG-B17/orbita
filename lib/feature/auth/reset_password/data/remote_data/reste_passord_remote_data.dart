import 'package:dio/dio.dart';
import '../../../../../core/errors/exception/exception.dart';
import '../../../../../core/helper/dio_helper/api_end_ponit.dart';
import '../../../../../core/helper/dio_helper/dio_helper.dart';

class ResetPasswordRemoteData {

  Future<Map<String,dynamic>> resetPassword ({required String email})async{
    try{
      final result = await DioHelper.postData(url: ApiEndPoint.resetPassword,query:{"email":email});
      return result?.data;
    }catch(e){
      if(e is DioException){
        throw ResetPasswordException(message: e.response?.data);
      }else{
        throw ServerException();
      }
    }
  }
}