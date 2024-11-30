import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_cubit.dart';
import '../widgeets/button_getUser.dart';
import '../widgeets/landing.dart';
import '../widgeets/userdata.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              if (state is GetUserSuccessfully) {
                return ListView(
                  children: [
                    const LandingWidget(),
                    UserData(user: state.user),
                  ],
                );
              }
              if (state is GetUserFailure) {
                return Text(state.errMessage);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
