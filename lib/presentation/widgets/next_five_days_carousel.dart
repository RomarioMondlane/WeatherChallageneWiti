import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather/data/models/response.dart';
import 'package:weather/presentation/widgets/text_key_cutomized.dart';
import 'dart:math' as math;
import 'carousel_child.dart';
import 'text_value_customized.dart';

class NextFiveDaysCarousel extends StatefulWidget {
 final ResponseWeather responseWeather;
  const NextFiveDaysCarousel({Key? key,required this.responseWeather })
      : super(key: key);

  @override
  State<NextFiveDaysCarousel> createState() =>
      NextFiveDaysCarouselState();
}

class NextFiveDaysCarouselState extends State<NextFiveDaysCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(autoPlay: false),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                child: CarouselChild(responseWeather: widget.responseWeather,)
            );
          },
        );
      }).toList(),
    );
  }
}
