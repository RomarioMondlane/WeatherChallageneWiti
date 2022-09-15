import 'package:flutter/material.dart';
import 'package:weather/data/models/response.dart';
import 'package:weather/presentation/widgets/text_key_cutomized.dart';
import 'dart:math' as math;
import 'next_five_days_carousel.dart';
import 'text_value_customized.dart';

class CurrentWeather extends StatefulWidget {
  final ResponseWeather responseWeather;
  const CurrentWeather({Key? key, required this.responseWeather})
      : super(key: key);

  @override
  State<CurrentWeather> createState() =>
      CurrentLocationWeatherCardState();
}

class CurrentLocationWeatherCardState extends State<CurrentWeather> {
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
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:
                 Column(

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
            ))),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Center(
                    child: Text(widget.responseWeather.name,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Transform.rotate(
                      angle: 270 * math.pi / 180,
                      child:
                      InkWell(
                        onTap: () {_modalBottomSheetMenu(widget.responseWeather);},
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                  ),
              ],
            ),
                )),
          ],
        )),
        height: 100);

  }
  void _modalBottomSheetMenu(ResponseWeather responseWeather){
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35.0),
          ),
        ),
        builder: (builder){
          return Column(
            children: [
          Center(

            child: ListTile(
            title: Text(widget.responseWeather.name,style: TextStyle(
                fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.w800),textAlign: TextAlign.center),
            )
          ),

              Padding(
                padding: EdgeInsets.only(top: 0),

                child:  NextFiveDaysCarousel(responseWeather: responseWeather,)),
            ],
          );
        }
    );
  }

}
