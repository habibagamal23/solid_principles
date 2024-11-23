import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_p/features/cart/logic/weather_cubit.dart';
import 'core/di/di.dart';
import 'features/cart/ui/screens/weather.dart';

void main() {
  setGetIt();
  runApp(BlocProvider(create: (_) =>
  getIt<WeatherCubit>()..fetchWeather("cairo"),
      child: const MyApp()));
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
        home: WeatherScreen());
  }
}
