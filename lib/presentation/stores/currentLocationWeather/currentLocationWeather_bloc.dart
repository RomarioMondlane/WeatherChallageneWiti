import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/main.dart';
import 'package:weather/data/models/response.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/models/wind.dart';
import 'package:weather/domain/utils/parseJsonToResponseWeather.dart';
import 'package:weather/domain/utils/weatherApi.dart';
import 'currenttLocationWeather_event.dart';
import 'currenttLocationWeather_state.dart';

class CurrentLocationWeatherBloc
    extends Bloc<CurrentLocationWeatherEvent, CurrentLocationWeatherState> {
  final weatherApi = WeatherApi();

  CurrentLocationWeatherBloc() : super(CurrentLocationWeatherInitialState()) {
    ResponseWeather responseWeather = new ResponseWeather(
        main: new Main(
            temp: 0, temp_max: 0, temp_min: 0, pressure: 0, humidity: 0),
        weather: new Weather(main: "", clouds: "", description: "", icon: ""),
        wind: new Wind(speed: 0, deg: 0),
        name: "");
    on<isGettingCurrentLocationWeatherEvent>((event, emit) async =>
        await weatherApi
            .getCurrentLocationWeather()
            .then((value) => responseWeather = value)
            .whenComplete(() => emit(CurrentLocationWeatherSuccessState(
                responseWeather: responseWeather))));

    //on<AddCurrentLocationWeatherEvent>((event, emit) => null);
  }
}
