import 'package:dio/dio.dart';
import 'package:docdoc_app/core/networking/api_service.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/login/data/repository/login_repo.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  //registerFactory if we want to create object in every use
  //registerlazeysingelton create only one object and reused everywhere
  //when use getIt will be available in all widgets and all pages that need this instance
  //Dio & Api Service
  //Here, LoginRepo depends on ApiService.
  //getIt() by itself = GetIt will fetch the dependency that matches the type expected by the constructor.

  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
