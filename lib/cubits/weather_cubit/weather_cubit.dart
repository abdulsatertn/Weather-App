import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherLoading());

  WeatherService weatherService;
  void getWeather({required String cityName}) async {
    WeatherModel? weatherModel;
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
