import 'package:flutter/material.dart';
import 'package:weather/data/models/response.dart';
import 'package:weather/presentation/widgets/text_key_cutomized.dart';

import 'text_value_customized.dart';

class CurrentLocationWeather extends StatefulWidget {
  final ResponseWeather responseWeather;
  const CurrentLocationWeather({Key? key, required this.responseWeather})
      : super(key: key);

  @override
  State<CurrentLocationWeather> createState() =>
      CurrentLocationWeatherCardState();
}

class CurrentLocationWeatherCardState extends State<CurrentLocationWeather> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
            child: Row(
          children: <Widget>[
            Expanded(
              child: Image.network("https://openweathermap.org/img/w/" +
                  widget.responseWeather.weather.icon +
                  ".png"),
            ),
            Expanded(
              child: Text(widget.responseWeather.main.temp.toString(),
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextKeyCustomized(text: "max: "),
                    TextValueCustomized(
                        value: widget.responseWeather.main.temp_max.toString())
                  ],
                ),
                Row(
                  children: [
                    TextKeyCustomized(text: "min: "),
                    TextValueCustomized(
                        value: widget.responseWeather.main.temp_min.toString())
                  ],
                ),
                Row(
                  children: [
                    TextKeyCustomized(text: "wind: "),
                    TextValueCustomized(
                        value: widget.responseWeather.wind.speed.toString()),
                  ],
                ),
                Row(
                  children: [
                    TextKeyCustomized(text: "humidity: "),
                    TextValueCustomized(
                        value: widget.responseWeather.main.humidity.toString())
                  ],
                )
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.responseWeather.name,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ],
            )),
          ],
        )),
        height: 100);
  }
}
