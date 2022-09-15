import 'package:weather/data/models/main.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/models/wind.dart';

class NextFiveDaysWeather  {
  late final Main main;
  late final Weather weather;
  late final Wind wind;
  late final String dt_txt;

  NextFiveDaysWeather(
      {required this.main,
        required this.weather,
        required this.wind,
        required this.dt_txt});



}