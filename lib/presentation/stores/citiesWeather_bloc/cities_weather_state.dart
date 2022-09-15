import '../../../data/models/response.dart';

abstract class CitiesWeatherState {
  late List<ResponseWeather> citiesWeatherState;

  CitiesWeatherState({
    required this.citiesWeatherState,
  });
}

class CurrentCitiesWeatherInitialState extends CitiesWeatherState {
  CurrentCitiesWeatherInitialState() : super(citiesWeatherState: []);
}

class CitiesWeatherSuccessState extends CitiesWeatherState {
  //late final List<ResponseWeather> citiesResponseWeather;
  CitiesWeatherSuccessState(
      {required List<ResponseWeather> citiesResponseWeather})
      : super(citiesWeatherState: citiesResponseWeather);
}
