import 'package:flutter/cupertino.dart';
import 'package:weather/data/models/coord.dart';
import 'package:weather/data/models/main.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/models/wind.dart';

@immutable
class ResponseWeather {
  late final Main main;
  late final Weather weather;
  late final Wind wind;
  late final String name;

  late final Coord? coord;

  ResponseWeather(
      {required this.main,
      required this.weather,
      required this.wind,
       this.coord,
      required this.name});

  initial() {}
}
