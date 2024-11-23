import '../../../../core/network/api_consumer.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/network/api_result.dart';
import '../models/weather.dart';
import 'weatherrepo.dart';
// di , open closed , liksove , signle
class WeatherRepositoryImpl extends WeatherRepository {
  final ApiConsumer apiConsumer;

  WeatherRepositoryImpl(this.apiConsumer);

  @override
  Future<ApiResult<WeatherModel>> getWeather(String city) async {
    try {
      final response =
          await apiConsumer.get(ApiConstnt.URLWeather,
              queryParameters: {
        'q': city,
        'key': ApiConstnt.API_KEY,
      });
      return ApiResult.success(WeatherModel.fromJson(response.data));
    } catch (e) {
      return ApiResult.error('Failed to fetch weather data: ${e.toString()}');
    }
  }
}
