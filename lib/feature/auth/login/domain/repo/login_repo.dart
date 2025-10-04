import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure/failure.dart';
import '../entity/login_entity.dart';

abstract class LoginRepo {

  Future<Either<Failure,Map<String,dynamic>>> login ({required LoginEntity loginEntity});
}