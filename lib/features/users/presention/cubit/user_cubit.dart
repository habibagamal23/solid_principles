import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:solid_p/core/network/dio_service.dart';
import 'package:solid_p/features/users/data/datasources/UserRemoteDataSource.dart';

import '../../../../core/cachhelper/chachhelpe.dart';
import '../../../../core/connection/NetworkInfo.dart';
import '../../data/datasources/locl.dart';
import '../../data/repo/repo.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecases/getuser.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser getUser;
  UserCubit(this.getUser) : super(UserInitial());
  getUserFun(int id) async {
    emit(GetUserLoading());
    final result = await getUser.call(id: id.toString());
    result.fold(
      (failure) => emit(GetUserFailure(errMessage: failure.errMessage)),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
