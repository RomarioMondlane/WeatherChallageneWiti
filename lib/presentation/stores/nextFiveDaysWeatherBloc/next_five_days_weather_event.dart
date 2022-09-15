
import 'package:weather/data/models/next_five_days.dart';

abstract class NextFiveDaysWeatherEvent {}


class isGettingNextFiveDaysWeatherEvent extends NextFiveDaysWeatherEvent {
      final double lat;
      final double long;
      isGettingNextFiveDaysWeatherEvent({
    required this.lat,required this.long
  });
}
