import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:solid_p/core/network/apiConsumer.dart';
import 'package:solid_p/core/network/dio_service.dart';
import 'package:solid_p/core/network/diofactory.dart';
import 'package:solid_p/features/getwather/data/repo/weather_repo_imp.dart';
import 'package:solid_p/features/getwather/data/repo/weatherreop.dart';
import 'package:solid_p/features/getwather/logic/weather_cubit.dart';

import '../../features/users/data/datasources/UserRemoteDataSource.dart';
import '../../features/users/data/datasources/locl.dart';
import '../../features/users/data/repo/repo.dart';
import '../../features/users/domain/repositories/userrepo.dart';
import '../../features/users/domain/usecases/getuser.dart';
import '../../features/users/presention/cubit/user_cubit.dart';
import '../cachhelper/chachhelpe.dart';
import '../connection/NetworkInfo.dart';

final getit = GetIt.instance;

void setGetit() {
  /// dio
  getit.registerLazySingleton<Dio>(() => DioFcatory.getDio());

  /// api consumer

  getit.registerLazySingleton<ApiConsumer>(() => DioService(dio: getit<Dio>()));
  getit.registerLazySingleton<WeatherRepo>(
      () => WeatherRepoImpl(getit<ApiConsumer>()));
  getit.registerFactory<WeatherCubit>(() => WeatherCubit(getit<WeatherRepo>()));

  /// cubit -> weather repo (perant) ,
  /// weather repo imp => api consumer
  ///
  ///
  /// user   1- cubit
  // NetworkInfo setup (check internet connection)
  getit.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  // CacheHelper setup (local cache)
  getit.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Data sources (remote and local)
  getit.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSource(api: getit<ApiConsumer>()));
  getit.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(cache: getit<CacheHelper>()));

  // User Repository implementation
  getit.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: getit<UserRemoteDataSource>(),
      localDataSource: getit<UserLocalDataSource>(),
      networkInfo: getit<NetworkInfo>(),
    ),
  );

  // UseCase
  getit.registerLazySingleton<GetUser>(
      () => GetUser(repository: getit<UserRepository>()));

  // UserCubit
  getit.registerFactory<UserCubit>(() => UserCubit(getit<GetUser>()));
}
