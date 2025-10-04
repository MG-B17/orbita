import 'package:dartz/dartz.dart';
import '../../../../../core/errors/error_message.dart';
import '../../../../../core/errors/exception/exception.dart';
import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/repo/login_repo.dart';
import '../login_remote_data/login_remote_data.dart';

class LoginRepoImpl extends LoginRepo{
  final LoginRemoteData loginRemoteData;
  final NetworkInfo networkInfo;

  LoginRepoImpl({required this.networkInfo,required this.loginRemoteData});
  @override
  Future<Either<Failure,Map<String,dynamic>>> login({required LoginEntity loginEntity})async {
    if(await networkInfo.isConnected()){
      try{
        final result = await loginRemoteData.login(loginEntity: loginEntity);
        return right(result);
      }on ServerException{
        return left(ServerFailure(errorMessage: ErrorStrings.serverError));
      }on LoginException catch(e){
        return left(LoginFailure(errorMessage: e.error));
      }
    }
    else{
      return left(NetworkFailure(errorMessage: ErrorStrings.checkYouInternetConnection));
    }
  }

}