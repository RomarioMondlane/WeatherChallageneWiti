import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/response.dart';
import 'package:weather/presentation/widgets/tab_guide.dart';
import 'package:weather/presentation/widgets/text_key_cutomized.dart';
import 'dart:math' as math;
import '../stores/nextFiveDaysWeatherBloc/next_five_days_weather_bloc.dart';
import '../stores/nextFiveDaysWeatherBloc/next_five_days_weather_event.dart';
import '../stores/nextFiveDaysWeatherBloc/next_five_days_weather_state.dart';
import 'next_five_days_carousel.dart';
import 'text_value_customized.dart';

class CarouselChild extends StatefulWidget {
  final ResponseWeather responseWeather;
  const CarouselChild({Key? key, required this.responseWeather})
      : super(key: key);

  @override
  State<CarouselChild> createState() =>
      CarouselChildState();
}

class CarouselChildState extends State<CarouselChild> {

  late final NextFiveDaysWeatherBloc nextFiveDaysWeatherBloc;
  @override
  Widget build(BuildContext context) {
    return
      Builder(
      builder: (context) {
        return Container(
          child: BlocBuilder<NextFiveDaysWeatherBloc,
            NextFiveDaysWeatherState>(
            bloc: nextFiveDaysWeatherBloc,
            builder: (context, state) {
          if (state is NextFiveDaysWeatherSuccessState ){

             return  Stack(
              children: <Widget>[
                TabGuide(nextFiveDaysWeather: state.responseNextFiveDaysWeather),

              ],
            );

          }else{
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                 color: Colors.amber,
              ),
            );
          }
            }
          ),
        );
      }
    );

  }
  @override
  void initState() {
    super.initState();
    nextFiveDaysWeatherBloc=NextFiveDaysWeatherBloc();
    nextFiveDaysWeatherBloc.add(isGettingNextFiveDaysWeatherEvent(lat: widget.responseWeather.coord!.lat,long: widget.responseWeather.coord!.lon));
  }

}
