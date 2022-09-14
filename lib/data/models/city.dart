import 'package:flutter/cupertino.dart';

@immutable
class City {
  late final String name;

  late final String countryCode;
  late final double lat;
  late final double long;

  City(
      {required this.name,
      required this.countryCode,
      required this.lat,
      required this.long});
}
