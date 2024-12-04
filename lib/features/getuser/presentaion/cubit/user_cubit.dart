import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:solid_p/features/getuser/domain/entitys/userEntity.dart';

import '../../domain/usecase/getuser.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  GetUser user;
  UserCubit(this.user) : super(UserInitial());

  getUserFun(int id) async {
    emit(UserLoading());
    final reslt = await user.call(id: id.toString());
    if (reslt.isSuccess) {
      emit(UserSucces(reslt.data!));
    } else {
      emit(UserFeliur(reslt.error!));
    }
  }
}
