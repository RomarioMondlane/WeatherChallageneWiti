import 'package:weather/data/models/response.dart';

abstract class CurrentLocationWeatherEvent {}

class isGettingCurrentLocationWeatherEvent extends CurrentLocationWeatherEvent {
}

class GetCurrentLocationWeatherEvent extends CurrentLocationWeatherEvent {
  ResponseWeather responseWeather;

  GetCurrentLocationWeatherEvent({
    required this.responseWeather,
  });
}
