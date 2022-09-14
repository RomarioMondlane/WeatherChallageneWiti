import 'package:weather/data/models/response.dart';

abstract class CitiesWeatherEvent {}

class isGettingCitiesWeatherEvent extends CitiesWeatherEvent {}

class GetCitiesWeatherEvent extends CitiesWeatherEvent {
  ResponseWeather responseWeather;

  GetCitiesWeatherEvent({
    required this.responseWeather,
  });
}
