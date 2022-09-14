import 'package:flutter/cupertino.dart';

@immutable
class Wind {
  late final double speed;
  late final double deg;

  Wind({required this.speed, required this.deg});
}
