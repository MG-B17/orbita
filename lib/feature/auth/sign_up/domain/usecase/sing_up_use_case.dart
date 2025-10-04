import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure/failure.dart';
import '../entity/sing_up_entity.dart';
import '../repo/sing_up_repo.dart';

class SingUpUseCase{

  final SingUpRepo singUpRepo;

  SingUpUseCase({required this.singUpRepo});

  Future<Either<Failure,Map<String,dynamic>>>call({required SingUpEntity singUpEntity})async{
    return await singUpRepo.singUp(singUpEntity: singUpEntity);
  }
}