import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure/failure.dart';

abstract class ResetPasswordRepo {
  
  Future<Either<Failure,Map<String,dynamic>>> resetPassword({required String email});
}