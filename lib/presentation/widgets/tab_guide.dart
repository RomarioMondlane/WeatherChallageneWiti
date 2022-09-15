import 'package:flutter/material.dart';
import 'package:weather/data/models/next_five_days.dart';
import 'package:weather/data/models/response.dart';
import 'package:weather/presentation/widgets/tab_bar_view.dart';
import 'package:weather/presentation/widgets/text_key_cutomized.dart';
import 'package:weather/presentation/widgets/text_value_customized.dart';


import '../../data/models/next_five_days.dart';
import '../../data/models/next_five_days.dart';

class TabGuide extends StatefulWidget {
  final List<NextFiveDaysWeather> nextFiveDaysWeather;

  const TabGuide({Key? key, required this.nextFiveDaysWeather}) : super(key: key);

  @override
  State<TabGuide> createState() => TabGuideState();
}

class TabGuideState extends State<TabGuide> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(

          appBar: AppBar(
            foregroundColor: Colors.black,
         toolbarHeight: 20,
            centerTitle:true,
            title:  Text(widget.nextFiveDaysWeather[0].dt_txt.substring(0,10)),
            elevation: 0,
          automaticallyImplyLeading: false,

        bottom:  TabBar(
          labelColor: Colors.black,
           indicatorColor: Colors.black,

        tabs: [
        TextValueCustomized(value:  widget.nextFiveDaysWeather[0].dt_txt.substring(11,16)),

          TextValueCustomized(value:  widget.nextFiveDaysWeather[1].dt_txt.substring(11,16)),

          TextValueCustomized(value:  widget.nextFiveDaysWeather[2].dt_txt.substring(11,16)),
    ],
    ),
    ),
    body:  TabBarView(
    children: [

    TabBarViewWeather(nextFiveDaysWeather: widget.nextFiveDaysWeather[0]),

      TabBarViewWeather(nextFiveDaysWeather: widget.nextFiveDaysWeather[1]),

      TabBarViewWeather(nextFiveDaysWeather: widget.nextFiveDaysWeather[2]),

    ],
    ),
    ));
  }
}
