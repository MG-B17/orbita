
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/domain/entity/login_entity.dart';
import '../login/domain/usecase/login_use_case.dart';
import '../reset_password/domain/usecase/reset_password_use_case.dart';
import '../sign_up/domain/entity/sing_up_entity.dart';
import '../sign_up/domain/usecase/sing_up_use_case.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates>{
  final LoginUseCase loginUseCase;
  final SingUpUseCase singUpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthCubit({required this.singUpUseCase,required this.loginUseCase,required this.resetPasswordUseCase}):super(AuthInitialState());

  static AuthCubit get(context)=>BlocProvider.of(context);

  Future<void>login({required String userName,required String password})async{
    emit(LoadingLogin());
    final loginEntity = LoginEntity(userName: userName, password: password);
    final result = await loginUseCase(loginEntity: loginEntity);
    result.fold(
            (failure)=>emit(LoginFail(errorMessage:failure.errorMessage)),
            (r){
          emit(LoginSuccessful());
        });
  }

  Future<void> singUp ({required String userName ,required String email,required String password ,required String confirmPassword})async{
    emit(LoadingSingUp());
    final SingUpEntity singUpEntity = SingUpEntity(userName: userName, email: email, password: password);
    final result = await singUpUseCase(singUpEntity: singUpEntity);
    result.fold((failure)=>emit(SingUpFail(errorMessage:failure.errorMessage)),(r)=>emit(SingUpSuccessful(message: r.values.first)));
  }

  Future<void> resetPassword({required String email})async{
    emit(LoadingRestPassword());
    final result = await resetPasswordUseCase(email: email);
    result.fold((failure)=>emit(RestPasswordFail(errorMessage: failure.errorMessage)),(result)=>emit(RestPasswordSuccessful(message: result.values.first)));
  }
}