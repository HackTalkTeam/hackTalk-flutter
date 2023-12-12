import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hack_talk/core/helpers/cache_helper.dart';
import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/network_helper.dart';
import 'package:hack_talk/features/welcome/data/data_sources/splash_data_source.dart';
import 'package:hack_talk/features/welcome/data/repositories/splash_repository_imp.dart';
import 'package:hack_talk/features/welcome/domain/repositories/splash_repository.dart';
import 'package:hack_talk/features/welcome/domain/use_cases/auto_login_usecase.dart';
import 'package:hack_talk/features/welcome/presentation/logic/onBoarding_cubit/on_boarding_cubit.dart';
import 'package:hack_talk/features/welcome/presentation/logic/splash_cubit/splash_cubit.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final inj = GetIt.instance;

Future<void> init() async {
  ///
  /// On boarding
  ///
  inj.registerFactory(() => OnBoardingCubit());

  ///
  /// Splash
  ///
  inj.registerFactory(() => SplashCubit(autoLoginUseCase: inj()));
  inj.registerLazySingleton(() => AutoLoginUseCase(splashRepository: inj()));
  inj.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImp(splashDataSource: inj()));
  inj.registerLazySingleton<SplashDataSource>(
      () => SplashDataSourceImp(dioHelper: inj(), networkHelper: inj()));

  ///
  /// Core
  ///
  inj.registerLazySingleton<NetworkHelper>(
      () => NetworkHelperImp(internetConnection: inj()));
  inj.registerLazySingleton<DioHelper>(() => DioHelperImp(dio: inj()));
  inj.registerLazySingleton<CacheHelper>(
      () => CacheHelperImp(sharedPref: inj()));

  ///
  /// Base
  ///
  final sharedPref = await SharedPreferences.getInstance();
  inj.registerLazySingleton(() => sharedPref);
  inj.registerLazySingleton(() => Dio());
  inj.registerLazySingleton(() => InternetConnection());
}
