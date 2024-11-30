import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:solid_p/features/getwather/data/models/weather.dart';
import 'package:solid_p/features/getwather/data/repo/weatherreop.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherRepo weatherRepo;
  WeatherCubit(this.weatherRepo) : super(WeatherInitial());

  Future FeatchWeather()async{
    emit(WeatherLoading());
     var result =await weatherRepo.getWeather();
     if(result.isSuccess){
       emit(WeatherSuccess(result.data!));
     }else{
       emit(WeatherError(result.error!));
     }

  }


}
