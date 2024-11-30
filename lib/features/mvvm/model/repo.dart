import 'package:dio/dio.dart';
import 'package:solid_p/features/mvvm/model/usermodelmvv.dart';
import '../../../core/network/ApiResult.dart';
import '../../../core/network/apiConsumer.dart';
import '../../../core/network/Api_constant.dart';
import '../../mvcuser/model/usermvcmodel.dart';

class UserRepositoryMvvm {
  final ApiConsumer dioService;

  UserRepositoryMvvm({required this.dioService});

  Future<ApiResult<UserModelMvvm>> fetchUserData() async {
    try {
      final resp = await dioService.get("${ApiConstnt.baserUrl}/${ApiConstnt.user}/1");
      return ApiResult.success(UserModelMvvm.fromJson(resp));
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
