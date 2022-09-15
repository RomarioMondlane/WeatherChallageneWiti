import 'package:flutter/material.dart';
import 'package:weather/presentation/widgets/text_key_cutomized.dart';
import 'package:weather/presentation/widgets/text_value_customized.dart';

import '../../data/models/next_five_days.dart';

class TabBarViewWeather extends StatefulWidget {
  final NextFiveDaysWeather nextFiveDaysWeather;

  const TabBarViewWeather(
      {super.key, required this.nextFiveDaysWeather});

  @override
  State<TabBarViewWeather> createState() => TabBarViewWeatherState();
}

class TabBarViewWeatherState extends State<TabBarViewWeather> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            Image.network("https://openweathermap.org/img/w/" +
                widget.nextFiveDaysWeather.weather.icon +
                ".png",scale: 0.5),
            Text("${widget.nextFiveDaysWeather.main.temp_min}|${widget.nextFiveDaysWeather.main.temp_max}",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            TextKeyCustomized(text: "humidity: "),
            TextValueCustomized(
                value: widget.nextFiveDaysWeather.main.humidity.toString()),
            TextKeyCustomized(text: "wind: "),
            TextValueCustomized(
                value: widget.nextFiveDaysWeather.wind.speed.toString()),
            TextKeyCustomized(text: "description: "),
            TextValueCustomized(
                value: widget.nextFiveDaysWeather.weather.description)


          ]
      ),
    );
  }
}