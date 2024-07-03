 import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubits/weather/weather_state.dart';
import 'package:weather_app_bloc/models/weather_model.dart';
  import '../../services/weather_service.dart';
class WeatherCubit extends Cubit<WeatherState> {

 final WeatherService service;

  WeatherCubit(this.service) : super(WeatherInit());
String? cityName ;
  getWeather({required String cityName}) async {
    emit(WeatherLoading());
   try {
     WeatherModel? weatherModel = await service.getWeather(cityName: cityName);
     emit(WeatherSuccess(weatherModel));
   } on Exception catch (e) {
     log(e.toString());
     emit(WeatherFailure());
   }

  }
}  