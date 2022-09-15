


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/next_five_days.dart';

import '../../../domain/utils/weatherApi.dart';
import 'next_five_days_weather_event.dart';
import 'next_five_days_weather_state.dart';

class NextFiveDaysWeatherBloc extends Bloc<NextFiveDaysWeatherEvent, NextFiveDaysWeatherState> {


  NextFiveDaysWeatherBloc() : super(NextFiveDaysWeatherInitialState()) {
    final weatherApi = WeatherApi();
    List<NextFiveDaysWeather> responseNextFiveDaysWeather = [];

    on<isGettingNextFiveDaysWeatherEvent>((event, emit) async => await weatherApi
        .getNextFiveDaysWeather(event.long, event.lat)
        .then((value) => {
          for(int i=0;i<value.length;i++)
            {

              responseNextFiveDaysWeather.add(value[i]),

            },

        })
        .whenComplete(() =>emit(NextFiveDaysWeatherSuccessState(responseNextFiveDaysWeather: responseNextFiveDaysWeather))
    ));

    //on<AddCurrentLocationWeatherEvent>((event, emit) => null);
  }
}