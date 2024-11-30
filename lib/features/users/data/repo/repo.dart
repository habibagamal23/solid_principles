
import 'package:solid_p/features/users/data/models/user_model.dart';

import '../../../../core/connection/NetworkInfo.dart';
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
  Future<ApiResult<UserEntity>> getUser({required String id}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remoteDataSource.getUser(id);
        localDataSource.cacheUser(remoteUser);
        return ApiResult.success(remoteUser);
      } catch (e) {
        return ApiResult.error("Failed to fetch user data");
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        return ApiResult.success(localUser);
      } catch (e) {
        return ApiResult.error("No Internet Connection");
      }
    }
  }
}
