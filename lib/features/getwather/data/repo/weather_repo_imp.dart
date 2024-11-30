import 'dart:math';

import 'package:solid_p/core/network/ApiResult.dart';
import 'package:solid_p/core/network/Api_constant.dart';
import 'package:solid_p/core/network/apiConsumer.dart';
import 'package:solid_p/features/getwather/data/models/weather.dart';
import 'package:solid_p/features/getwather/data/repo/weatherreop.dart';

class WeatherRepoImpl implements WeatherRepo {
  final ApiConsumer apiConsumer;

  WeatherRepoImpl(this.apiConsumer);

  @override
  Future<ApiResult<WeatherData>> getWeather() async {
    try {
      final resp = await apiConsumer.get(ApiConstnt.URLWeather,
          querParmeter: {'q': 'cairo', 'key': ApiConstnt.API_KEY});
      return ApiResult.success(WeatherData.fromJson(resp));
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
