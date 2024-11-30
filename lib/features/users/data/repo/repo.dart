
import 'package:dartz/dartz.dart';
import 'package:solid_p/features/users/data/models/user_model.dart';

import '../../../../core/connection/NetworkInfo.dart';
import '../../../../core/error/expentions.dart';
import '../../../../core/error/feliuier.dart';
import '../../../../core/network/ApiResult.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repositories/userrepo.dart';
import '../datasources/UserRemoteDataSource.dart';
import '../datasources/locl.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser({required String id}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remoteDataSource.getUser(id);
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    }
    else {
      try {
        final localUser = await localDataSource.getLastUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
