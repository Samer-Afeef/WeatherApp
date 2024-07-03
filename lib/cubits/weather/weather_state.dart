import 'package:weather_app_bloc/models/weather_model.dart';

abstract class WeatherState {}

 class WeatherInit extends WeatherState {}
 class WeatherLoading extends WeatherState {}
 class WeatherSuccess extends WeatherState {
 final WeatherModel weatherData;
 WeatherSuccess(this.weatherData);
 }
class WeatherFailure extends WeatherState {}
