import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  final double temperature;
  final String cityName;

  const WeatherDetails({
    Key? key,
    required this.temperature,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Temperature: $temperature°C in $cityName',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}