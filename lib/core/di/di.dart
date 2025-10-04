import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../feature/auth/controller/auth_cubit.dart';
import '../../feature/auth/login/data/login_remote_data/login_remote_data.dart';
import '../../feature/auth/login/data/repo_impl/login_repo_impl.dart';
import '../../feature/auth/login/domain/repo/login_repo.dart';
import '../../feature/auth/login/domain/usecase/login_use_case.dart';
import '../../feature/auth/reset_password/data/remote_data/reste_passord_remote_data.dart';
import '../../feature/auth/reset_password/data/repo_impl/reset_password_repo_impl.dart';
import '../../feature/auth/reset_password/domain/repo/rest_password_repo.dart';
import '../../feature/auth/reset_password/domain/usecase/reset_password_use_case.dart';
import '../../feature/auth/sign_up/data/remote_data/sing_up_remote_data.dart';
import '../../feature/auth/sign_up/data/repo_impl/sing_up_repo_impl.dart';
import '../../feature/auth/sign_up/domain/repo/sing_up_repo.dart';
import '../../feature/auth/sign_up/domain/usecase/sing_up_use_case.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init()async{
  //cubit
  sl.registerLazySingleton<AuthCubit>(()=>AuthCubit(singUpUseCase: sl(), loginUseCase: sl(), resetPasswordUseCase:  sl()));

  //useCases
  sl.registerLazySingleton<LoginUseCase>(()=>LoginUseCase(loginRepo: sl()));
  sl.registerLazySingleton<SingUpUseCase>(()=>SingUpUseCase(singUpRepo: sl()));
  sl.registerLazySingleton<ResetPasswordUseCase>(()=>ResetPasswordUseCase(resetPasswordRepo: sl()));



  //repos
  sl.registerLazySingleton<LoginRepo>(()=>LoginRepoImpl(networkInfo: sl(), loginRemoteData: LoginRemoteData()));
  sl.registerLazySingleton<SingUpRepo>(()=>SingUpRepoImpl(networkInfo: sl(), singUpRemoteData: sl()));
  sl.registerLazySingleton<ResetPasswordRepo>(()=>ResetPasswordRepoImpl(resetPasswordRemoteData: sl(), networkInfo:  sl()));

  //remote Data
  sl.registerLazySingleton<LoginRemoteData>(()=>LoginRemoteData());
  sl.registerLazySingleton<SingUpRemoteData>(()=>SingUpRemoteData());
  sl.registerLazySingleton<ResetPasswordRemoteData>(()=>ResetPasswordRemoteData());
  //network
  sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(internetConnection: InternetConnection()));
}