import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure/failure.dart';
import '../entity/login_entity.dart';
import '../repo/login_repo.dart';

class LoginUseCase {

  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<Either<Failure,Map<String,dynamic>>> call ({required LoginEntity loginEntity})async{
    return await loginRepo.login(loginEntity: loginEntity);
  }
}