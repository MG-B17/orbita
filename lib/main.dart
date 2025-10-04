import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackthon/orbita.dart';
import 'config/bloc_observer.dart';
import 'core/di/di.dart';
import 'core/helper/dio_helper/dio_helper.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

 // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  DioHelper.initialDio();
  await init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}


