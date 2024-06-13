import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isaghi/core/helpers/dio_helper.dart';
import 'package:isaghi/core/src/app_exports.dart';
import 'package:isaghi/features/home/cubit/home_cubit.dart';
import 'package:isaghi/features/home/data/apis/weather_api.dart';
import 'package:isaghi/features/home/data/repositories/weather_repository.dart';

GetIt getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory<LocalizationBloc>(() => LocalizationBloc());
  getIt.registerFactory<InternetCubit>(() => InternetCubit(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  //Shared preferences
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  // Connectivity
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  //Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());

  //Api
  getIt.registerLazySingleton<WeatherApi>(() => WeatherApi(getIt()));

  //Repo
  getIt.registerLazySingleton<WeatherRepository>(
      () => WeatherRepository(getIt()));
}
