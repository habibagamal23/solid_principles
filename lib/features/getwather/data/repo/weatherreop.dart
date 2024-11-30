import 'package:solid_p/features/getwather/data/models/weather.dart';

import '../../../../core/network/ApiResult.dart';

abstract class WeatherRepo{
  Future<ApiResult<WeatherData>> getWeather();

}