import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_p/features/getuser/presentaion/cubit/user_cubit.dart';

import '../widgets/userData.dart';

class Userscreenclean extends StatelessWidget {
  const Userscreenclean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserSucces) {
        return UserData(user: state.userEntity);
      }
      if (state is UserFeliur) {
        return Text(state.err);
      }
      return Text("intial");
    }));
  }
}
