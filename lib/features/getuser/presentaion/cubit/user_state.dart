part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSucces extends UserState {
  UserEntity userEntity;
  UserSucces(this.userEntity);
}

final class UserFeliur extends UserState {
  String err;
  UserFeliur(this.err);
}
