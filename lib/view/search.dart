import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubits/weather/weather_cubit.dart';

class SearchView extends StatelessWidget {
 const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
 String? cityName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:    Colors.orange.withOpacity(1),
        title: const Text('Search a City'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.orange[300]!,
                Colors.orange[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (data) async {
                cityName = data;
                BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName??"");
                BlocProvider.of<WeatherCubit>(context).cityName =cityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal:16 ),
                label: const Text('search'),
                labelStyle: TextStyle(color: Colors.grey.shade700,fontSize: 16),
                suffixIcon: GestureDetector(
                  onTap : () async
                  {
                  BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName?? 'Sanna');
                  Navigator.pop(context);
                  },
                  child: const Icon(Icons.search)),
                hintText: 'Enter a city',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

