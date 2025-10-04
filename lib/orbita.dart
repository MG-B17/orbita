import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/feature/auth/login/presentation/screen/login_screen.dart';

import 'feature/auth/controller/auth_cubit.dart';
import 'core/di/di.dart'as di;
import 'feature/upload/presentation/widgets/custom_loaded.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child){
        return MultiBlocProvider(
          providers: [
            BlocProvider(create:(context)=>di.sl<AuthCubit>()),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: FileUploadLoading()
          ),
        );
      },
    );
  }
}