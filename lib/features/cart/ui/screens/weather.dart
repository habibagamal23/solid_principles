import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_p/features/cart/logic/weather_cubit.dart';
import 'package:solid_p/features/cart/ui/widgets/WeatherDetails.dart';

import '../widgets/error_widget.dart';
import '../widgets/inital_widget.dart';


class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoaded) {
            return WeatherDetails(
              temperature: state.weather.current.tempC,
              cityName: state.weather.location.name,
            );
          } else if (state is WeatherError) {
            return ErrorMessage(message: state.message);
          }
          return const InitialMessage();
        },
      ),
    );
  }
}
