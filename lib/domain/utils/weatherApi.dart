import 'package:http/http.dart';
import 'package:weather/data/models/city.dart';
import 'package:weather/data/models/main.dart';
import 'package:weather/data/models/response.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/models/wind.dart';
import 'package:weather/domain/utils/consts.dart';
import 'package:http/http.dart' as http;
import 'package:weather/domain/utils/get_current_location.dart';
import 'package:weather/domain/utils/parseJsonToResponseWeather.dart';

import '../../data/datasources/cities.dart';

class WeatherApi {
  Consts consts = new Consts();
  String httpClinte = "https://api.openweathermap.org/data/2.5/weather?";

  Future<List<ResponseWeather>> getWeather() async {
    List<ResponseWeather> citiesWeather = [];
    await Future.wait(new Cities().getCities().map((city) => http
            .get(Uri.parse(httpClinte +
                'lat=${city.lat}&lon=${city.long}&appid=${consts.apiKey()}'))
            .then((value) => citiesWeather.add(deserializeJson(value)))))
        .timeout((const Duration(seconds: 10)));
    return citiesWeather;
  }

  Future<ResponseWeather> getCurrentLocationWeather() async {
    double long = 0;
    double lat = 0;
    await getPosition()
        .then((value) => {long = value.longitude, lat = value.latitude});
    return await http
        .get(Uri.parse(
            httpClinte + 'lat=${lat}&lon=${long}&appid=${consts.apiKey()}'))
        .timeout(const Duration(seconds: 6))
        .then((value) => deserializeJson(value));
  }
}
