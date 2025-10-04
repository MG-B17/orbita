import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure/failure.dart';
import '../entity/sing_up_entity.dart';

abstract class SingUpRepo {

  Future<Either<Failure,Map<String,dynamic>>> singUp({required SingUpEntity singUpEntity});
}