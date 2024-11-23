import 'package:solid_p/features/cart/data/models/weather.dart';

import '../../../../core/network/api_result.dart';

abstract class WeatherRepository {
  Future<ApiResult<WeatherModel>> getWeather(String city);
}