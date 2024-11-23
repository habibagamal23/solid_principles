import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/weather.dart';
import '../data/repos/weatherrepo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    emit(WeatherLoading());
    final result = await weatherRepository.getWeather(city);
    if (result.isSuccess) {
      emit(WeatherLoaded(result.data!));
    } else {
      emit(WeatherError(result.error!));
    }
  }
}
