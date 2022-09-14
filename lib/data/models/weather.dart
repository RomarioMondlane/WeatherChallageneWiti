import 'package:flutter/cupertino.dart';

@immutable
class Weather {
  late final String main;
  late final String clouds;
  late final String description;
  late final String icon;

  Weather(
      {required this.main,
      required this.clouds,
      required this.description,
      required this.icon});
}
