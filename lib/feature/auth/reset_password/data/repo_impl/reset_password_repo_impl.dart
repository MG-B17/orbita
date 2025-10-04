

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_message.dart';
import '../../../../../core/errors/exception/exception.dart';
import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repo/rest_password_repo.dart';
import '../remote_data/reste_passord_remote_data.dart';

class ResetPasswordRepoImpl  extends ResetPasswordRepo{

  final ResetPasswordRemoteData resetPasswordRemoteData;
  final NetworkInfo networkInfo;

  ResetPasswordRepoImpl({required this.resetPasswordRemoteData,required this.networkInfo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> resetPassword({required String email})async{
    if(await networkInfo.isConnected()){
      try{
        final result = await resetPasswordRemoteData.resetPassword(email: email);
        return right(result);
      }on ResetPasswordException catch(e){
        return left(ResetPasswordFailure(errorMessage:e.message));
      }
      on ServerException{
        return left(ServerFailure(errorMessage: ErrorStrings.serverError));
      }
    }else{
      return left(NetworkFailure(errorMessage: ErrorStrings.checkYouInternetConnection));
    }
  }

}