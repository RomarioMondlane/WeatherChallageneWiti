import 'package:flutter/cupertino.dart';

@immutable
class Main {
  late final double temp;
  late final double temp_min;
  late final double temp_max;
  late final double pressure;
  late final double humidity;

  Main(
      {required this.temp,
      required this.temp_max,
      required this.temp_min,
      required this.pressure,
      required this.humidity});
}
