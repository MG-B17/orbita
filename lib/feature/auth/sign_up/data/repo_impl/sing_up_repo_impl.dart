
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_message.dart';
import '../../../../../core/errors/exception/exception.dart';
import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entity/sing_up_entity.dart';
import '../../domain/repo/sing_up_repo.dart';
import '../remote_data/sing_up_remote_data.dart';

class SingUpRepoImpl extends SingUpRepo{
  final SingUpRemoteData singUpRemoteData ;
  final NetworkInfo networkInfo ;

  SingUpRepoImpl({required this.networkInfo,required this.singUpRemoteData});
  @override
  Future<Either<Failure, Map<String, dynamic>>> singUp({required SingUpEntity singUpEntity})async {
    if(await networkInfo.isConnected()){
      try{
        final result = await singUpRemoteData.singUp(singUpEntity: singUpEntity);
        return right(result);
      }on ServerException{
        return left(ServerFailure(errorMessage:ErrorStrings.serverError));
      }on SingUpException catch(e){
        return Left(SingUpFailure(errorMessage:e.error));
      }
    }else{
      return left(NetworkFailure(errorMessage: ErrorStrings.checkYouInternetConnection));
    }
  }
}