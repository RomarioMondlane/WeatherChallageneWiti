import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/data/models/coord.dart';
import 'package:weather/data/models/main.dart';
import 'package:weather/data/models/next_five_days.dart';
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
      coord: new Coord(lat:double.parse(jsonDecode(responseHttp.body)['coord']['lat'].toString())
          , lon: double.parse(jsonDecode(responseHttp.body)['coord']['lon'].toString())),
      name: jsonDecode(responseHttp.body)['name'].toString());

  return responseWeather;
}


List<NextFiveDaysWeather> deserializeNextFiveDaysJson(Response responseHttp) {
  List<dynamic> decode=jsonDecode(responseHttp.body)['list'];

  List<NextFiveDaysWeather> list= [];

  late NextFiveDaysWeather responseNextFiveDaysWeather;
  for(int i=0;i<decode.length;i++){
    responseNextFiveDaysWeather = NextFiveDaysWeather(
        main: new Main(
            temp: double.parse(
                decode[i]['main']['temp'].toString()),
            humidity: double.parse(
                decode[i]['main']['humidity'].toString()),
            pressure: double.parse(
                decode[i]['main']['pressure'].toString()),
            temp_max: double.parse(
                decode[i]['main']['temp_max'].toString()),
            temp_min: double.parse(
                decode[i]['main']['temp_min'].toString())),
        weather: new Weather(
            main: decode[i]['weather'][0]['main'],
            clouds:
            decode[i]['weather'][0]['clouds'].toString(),
            description: decode[i]['weather'][0]
            ['description']
                .toString(),
            icon: decode[i]['weather'][0]['icon'].toString()),
        wind: new Wind(
            speed: double.parse(decode[i]['wind']['speed'].toString()),
            deg: double.parse(decode[i]['wind']['deg'].toString())),
        dt_txt: decode[i]['dt_txt'].toString().replaceAll("-", "/"));
  list.add( responseNextFiveDaysWeather);

  }


  return list;
}

