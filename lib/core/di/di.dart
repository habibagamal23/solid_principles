import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:solid_p/core/network/Dio_network/dio_service.dart';
import 'package:solid_p/core/network/api_consumer.dart';
import '../../features/getwather/data/repos/weatherrepo.dart';
import '../../features/getwather/data/repos/weathrerpoimp.dart';
import '../../features/getwather/logic/weather_cubit.dart';
import '../network/Dio_network/diofactory.dart';

final getIt = GetIt.instance;

void setGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioFcatory.getDio());

  /// API Consumer
  getIt.registerLazySingleton<ApiConsumer>(() => DioService(getIt<Dio>()));
  getIt.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(getIt<ApiConsumer>()));
  getIt.registerLazySingleton<WeatherCubit>(
      () => WeatherCubit(getIt<WeatherRepository>()));
}
