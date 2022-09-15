import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/stores/currentLocationWeather/currentLocationWeather_bloc.dart';
import 'package:weather/presentation/stores/currentLocationWeather/currenttLocationWeather_event.dart';
import 'package:weather/presentation/stores/currentLocationWeather/currenttLocationWeather_state.dart';


import '../stores/citiesWeather_bloc/cities_weather_bloc.dart';
import '../stores/citiesWeather_bloc/cities_weather_event.dart';
import '../stores/citiesWeather_bloc/cities_weather_state.dart';
import '../widgets/card_current_location_weather.dart';
import '../widgets/weeather_place_holder.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({super.key});

  @override
  State<WeatherList> createState() => WeatherListState();
}

class WeatherListState extends State<WeatherList> {

  late final CurrentLocationWeatherBloc currentLocationWeatherbloc;
  late final CitiesWeatherBloc citiesWeatherBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: BlocBuilder<CurrentLocationWeatherBloc,
                  CurrentLocationWeatherState>(
              bloc: currentLocationWeatherbloc,
              builder: (context, state) {
                if (state is CurrentLocationWeatherSuccessState) {
                  return CurrentWeather(
                      responseWeather: state.currentWeatherState);
                } else {
                  return WeatherPlaceHolder();
                }
              }),
          height: 100,
        ),
        Expanded(
          child: BlocBuilder<CitiesWeatherBloc, CitiesWeatherState>(
              bloc: citiesWeatherBloc,
              builder: (context, state) {
                if (state is CitiesWeatherSuccessState) {
                  print("##########################################");
                  return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(12),
                      itemCount: state.citiesWeatherState.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: CurrentWeather(
                              responseWeather: state.citiesWeatherState[index]),
                        );
                      });
                } else {
                  return Container();
                }
              }),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    currentLocationWeatherbloc = CurrentLocationWeatherBloc();
    currentLocationWeatherbloc.add(isGettingCurrentLocationWeatherEvent());
    citiesWeatherBloc = CitiesWeatherBloc();
    citiesWeatherBloc.add(isGettingCitiesWeatherEvent());
  }

  @override
  void dispose() {
    currentLocationWeatherbloc .close();
    citiesWeatherBloc.close();
    super.dispose();
  }

}
