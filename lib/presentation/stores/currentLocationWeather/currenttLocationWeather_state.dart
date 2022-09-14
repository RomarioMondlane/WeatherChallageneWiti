import 'package:weather/data/models/main.dart';
import 'package:weather/data/models/response.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/models/wind.dart';

abstract class CurrentLocationWeatherState {
  late ResponseWeather currentWeatherState;

  CurrentLocationWeatherState({
    required this.currentWeatherState,
  });
}

class CurrentLocationWeatherInitialState extends CurrentLocationWeatherState {
  CurrentLocationWeatherInitialState()
      : super(
            currentWeatherState: ResponseWeather(
                main: Main(
                    humidity: 0,
                    pressure: 0,
                    temp: 0,
                    temp_max: 0,
                    temp_min: 0),
                weather:
                    Weather(clouds: "", description: "", icon: "10d", main: ""),
                wind: Wind(deg: 0, speed: 0),
                name: ""));
}

class CurrentLocationWeatherSuccessState extends CurrentLocationWeatherState {
  late final ResponseWeather responseWeather;
  CurrentLocationWeatherSuccessState({required ResponseWeather responseWeather})
      : super(currentWeatherState: responseWeather);
}
