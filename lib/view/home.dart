import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubits/weather/weather_cubit.dart';
import 'package:weather_app_bloc/cubits/weather/weather_state.dart';
import 'package:weather_app_bloc/view/search.dart';

import '../models/weather_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.withOpacity(1),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchView();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
       body: BlocBuilder<WeatherCubit,WeatherState>(builder: (context, state) {
        if(state is WeatherLoading){
          return Container(
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
              child: const Center(child: CircularProgressIndicator(),));
        }else if(state is WeatherSuccess){
          return SuccessBody(weatherData: state.weatherData);
        } else if(state is WeatherFailure){
          return Container(
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
              child: const Center(child: Text('something went wrong please try again',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),));
        }else{
          return Container(
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
              child: const Center(child: Text('there is no weather 😔 start searching now 🔍',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),));
        }
       },)
    );
  }
}


class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    BlocProvider.of<WeatherCubit>(context).cityName?? "",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                  Text(
                        weatherData!.temp.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
                          Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                   Text(
                   weatherData!.weatherStateName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            );
  }
}
