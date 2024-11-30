import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_p/features/getwather/logic/weather_cubit.dart';
import 'package:solid_p/features/users/presention/cubit/user_cubit.dart';
import 'package:solid_p/features/users/presention/screens/user_screen.dart';

import 'core/cachhelper/chachhelpe.dart';
import 'core/di/di.dart';
import 'features/mvcuser/view/userview.dart';
import 'features/mvvm/view/userviewMvvm.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setGetit();
 await CacheHelper().init();
  runApp(BlocProvider(
    create: (context) => getit<UserCubit>()..getUserFun(1),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  UserView());
  }
}
