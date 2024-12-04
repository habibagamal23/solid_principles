import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_p/features/getuser/presentaion/cubit/user_cubit.dart';
import 'package:solid_p/features/getuser/presentaion/screens/UserScreenClean.dart';
import 'core/cachhelper/chachhelpe.dart';
import 'core/di/di.dart';
import 'features/mvcuser/view/userview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setGetit();
  await CacheHelper().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<UserCubit>()..getUserFun(2),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Userscreenclean()),
    );
  }
}
