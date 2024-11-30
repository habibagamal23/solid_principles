import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_p/features/getwather/logic/weather_cubit.dart';

import '../widgets/WeatherDetails.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return CircularProgressIndicator();
        }
        if (state is WeatherSuccess) {
          return WeatherDetails(
            temperature: state.weatherModel.current.tempC ?? 0.0,
            cityName: state.weatherModel.location.name ?? "no loaction",
          );
        }
        if (state is WeatherError) {
          return Text(state.err);
        }

        return SizedBox();
      }),
    );
  }
}
