import 'package:solid_p/core/network/ApiResult.dart';
import 'package:solid_p/features/getuser/domain/entitys/userEntity.dart';
import 'package:solid_p/features/getuser/domain/repo/UserRepostiry.dart';

import '../../../../core/connection/NetworkInfo.dart';
import '../data_source/UserRemoteDataSource.dart';
import '../data_source/userLoacalDataSource.dart';

class UserRepoImplemntion extends UserRepositry {
  NetworkInfo networkInfo;

  UserRemoteDataSource userRemoteDataSource;

  UserLocalDataSource userLocalDataSource;

  UserRepoImplemntion(
      {required this.networkInfo,
      required this.userLocalDataSource,
      required this.userRemoteDataSource});

  @override
  Future<ApiResult<UserEntity>> createUser(
      {required String name, required String pass}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<UserEntity>> getuser({required String id}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remotedata = await userRemoteDataSource.getuser(id: id);
        userLocalDataSource.cachUser(remotedata);
        return ApiResult.success(remotedata);
      } catch (e) {
        return ApiResult.error("error for get user remote $e");
      }
    } else {
      try {
        final locuser = await userLocalDataSource.getLastUser();
        return ApiResult.success(locuser);
      } catch (e) {
        return ApiResult.error(" not cach user  $e");
      }
    }
  }
}
