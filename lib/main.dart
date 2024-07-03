import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubits/weather/weather_cubit.dart';
import 'package:weather_app_bloc/VIEW/home.dart';
import 'package:weather_app_bloc/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
     create: (context) {
        return WeatherCubit(WeatherService());
      },
    child: const WeatherApp()));
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
