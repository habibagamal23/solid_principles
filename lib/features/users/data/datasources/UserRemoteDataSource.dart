import 'package:solid_p/core/network/Api_constant.dart';

import '../../../../core/network/apiConsumer.dart';
import '../models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});
  Future<UserModel> getUser(String id) async {
    try {
      final response =
          await api.get("${ApiConstnt.baserUrl}/${ApiConstnt.user}/$id");
      return UserModel.fromJson(response);
    } catch (e) {
      throw Exception("Error parsing user data: ${e.toString()}");
    }
  }
}
