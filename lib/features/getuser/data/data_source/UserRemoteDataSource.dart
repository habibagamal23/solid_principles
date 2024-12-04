import 'package:solid_p/core/network/Api_constant.dart';
import 'package:solid_p/core/network/apiConsumer.dart';
import 'package:solid_p/features/getuser/data/model/userModel.dart';

class UserRemoteDataSource {
  // di inversion highlevel not depended on low levle
  ApiConsumer apiConsumer;

  UserRemoteDataSource(this.apiConsumer);

  Future<UserModel> getuser({required String id}) async {
    try {
      final resp = await apiConsumer
          .get("${ApiConstnt.baserUrl}/${ApiConstnt.user}/$id");
      return UserModel.fromJson(resp);
    } catch (e) {
      throw Exception("Error Remote User$e");
    }
  }
}
