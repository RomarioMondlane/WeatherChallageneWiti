import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/response.dart';
import '../../../domain/utils/weatherApi.dart';
import 'cities_weather_event.dart';
import 'cities_weather_state.dart';

class CitiesWeatherBloc extends Bloc<CitiesWeatherEvent, CitiesWeatherState> {
  final weatherApi = WeatherApi();

  CitiesWeatherBloc() : super(CurrentCitiesWeatherInitialState()) {
    List<ResponseWeather> responseWeather = [];
    on<isGettingCitiesWeatherEvent>((event, emit) async => await weatherApi
        .getWeather()
        .then((value) => {
              for (int i = 0; i < value.length; i++)
                {responseWeather.add(value[i])}
            })
        .whenComplete(() => emit(CitiesWeatherSuccessState(
            citiesResponseWeather: responseWeather))));

    //on<AddCurrentLocationWeatherEvent>((event, emit) => null);
  }
}
