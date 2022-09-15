import 'package:weather/data/models/next_five_days.dart';

abstract class NextFiveDaysWeatherState {
  final  List<NextFiveDaysWeather> responseNextFiveDaysWeather;



  NextFiveDaysWeatherState({
    required this.responseNextFiveDaysWeather,
  });
}

class NextFiveDaysWeatherInitialState extends NextFiveDaysWeatherState {
  NextFiveDaysWeatherInitialState() : super(responseNextFiveDaysWeather: []);
}

class NextFiveDaysWeatherSuccessState extends NextFiveDaysWeatherState {

  NextFiveDaysWeatherSuccessState(
      {required List<NextFiveDaysWeather> responseNextFiveDaysWeather})
      : super(responseNextFiveDaysWeather:responseNextFiveDaysWeather );
}
