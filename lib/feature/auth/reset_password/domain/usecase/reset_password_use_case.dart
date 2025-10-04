import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure/failure.dart';
import '../repo/rest_password_repo.dart';

class ResetPasswordUseCase {
  final ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUseCase({required this.resetPasswordRepo});

  Future<Either<Failure,Map<String,dynamic>>> call({required String email})async{
    return await resetPasswordRepo.resetPassword(email: email);
  }
}