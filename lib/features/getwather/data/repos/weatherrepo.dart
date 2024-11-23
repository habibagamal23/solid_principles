
import '../../../../core/network/api_result.dart';
import '../models/weather.dart';
// open closed and
abstract class WeatherRepository {
  Future<ApiResult<WeatherModel>> getWeather(String city);
}