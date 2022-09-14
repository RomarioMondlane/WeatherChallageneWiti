import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/data/models/main.dart';
import 'package:weather/data/models/response.dart';
import 'package:http/http.dart' as http;
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/models/wind.dart';

ResponseWeather deserializeJson(Response responseHttp) {
  late ResponseWeather responseWeather;

  responseWeather = ResponseWeather(
      main: new Main(
          temp: double.parse(
              jsonDecode(responseHttp.body)['main']['temp'].toString()),
          humidity: double.parse(
              jsonDecode(responseHttp.body)['main']['humidity'].toString()),
          pressure: double.parse(
              jsonDecode(responseHttp.body)['main']['pressure'].toString()),
          temp_max: double.parse(
              jsonDecode(responseHttp.body)['main']['temp_max'].toString()),
          temp_min: double.parse(
              jsonDecode(responseHttp.body)['main']['temp_min'].toString())),
      weather: new Weather(
          main: jsonDecode(responseHttp.body)['weather'][0]['main'],
          clouds:
              jsonDecode(responseHttp.body)['weather'][0]['clouds'].toString(),
          description: jsonDecode(responseHttp.body)['weather'][0]
                  ['description']
              .toString(),
          icon: jsonDecode(responseHttp.body)['weather'][0]['icon'].toString()),
      wind: new Wind(
          speed: double.parse(jsonDecode(responseHttp.body)['wind']['speed'].toString()),
          deg: double.parse(jsonDecode(responseHttp.body)['wind']['deg'].toString())),
      name: jsonDecode(responseHttp.body)['name'].toString());

  return responseWeather;
}
