import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:solid_p/core/network/apiConsumer.dart';
import 'package:solid_p/core/network/dio_service.dart';
import 'package:solid_p/core/network/diofactory.dart';
import 'package:solid_p/features/getuser/data/data_source/UserRemoteDataSource.dart';
import 'package:solid_p/features/getuser/data/data_source/userLoacalDataSource.dart';
import 'package:solid_p/features/getuser/data/repo/userRepoImplentaion.dart';
import 'package:solid_p/features/getuser/domain/repo/UserRepostiry.dart';
import 'package:solid_p/features/getuser/domain/usecase/getuser.dart';
import 'package:solid_p/features/getuser/presentaion/cubit/user_cubit.dart';
import '../cachhelper/chachhelpe.dart';
import '../connection/NetworkInfo.dart';

final getit = GetIt.instance;

void setGetit() {
  /// dio
  getit.registerLazySingleton<Dio>(() => DioFcatory.getDio());

  /// api consumer

  getit.registerLazySingleton<ApiConsumer>(() => DioService(dio: getit<Dio>()));

  /// NetworkInfo setup (check internet connection)
  getit.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  /// CacheHelper setup (local cache)
  getit.registerLazySingleton<CacheHelper>(() => CacheHelper());

  /// Data sources (remote and local)
  getit.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSource(getit<ApiConsumer>()));

  getit.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(cacheHelper: getit<CacheHelper>()));

  /// User Repository implementation
  getit.registerLazySingleton<UserRepositry>(
    () => UserRepoImplemntion(
        networkInfo: getit<NetworkInfo>(),
        userLocalDataSource: getit<UserLocalDataSource>(),
        userRemoteDataSource: getit<UserRemoteDataSource>()),
  );

  /// UseCase
  getit.registerLazySingleton<GetUser>(
      () => GetUser(userRepositry: getit<UserRepositry>()));

  /// UserCubit
  getit.registerLazySingleton<UserCubit>(() => UserCubit(getit<GetUser>()));
}
