import 'package:dio/dio.dart';
import '../../../core/network/ApiResult.dart';
import '../../../core/network/apiConsumer.dart';
import '../../../core/network/Api_constant.dart';
import '../model/usermvcmodel.dart';
import '../../../core/di/di.dart';

class UserController {
  final ApiConsumer dioService = getit<ApiConsumer>();

  // دالة لجلب بيانات المستخدم
  Future<ApiResult<UserModelMvc>> fetchUserData() async {
    try {
      final resp = await dioService.get("${ApiConstnt.baserUrl}/${ApiConstnt.user}/1");
      return ApiResult.success(UserModelMvc.fromJson(resp));
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
