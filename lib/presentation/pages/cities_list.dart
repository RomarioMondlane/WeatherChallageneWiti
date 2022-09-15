import 'package:flutter/material.dart';
import 'package:weather/data/datasources/cities.dart';
import 'package:weather/presentation/widgets/list_tile_city_list.dart';

import '../widgets/card_current_location_weather.dart';

class CitiesList extends StatefulWidget {
  const CitiesList({super.key});

  @override
  State<CitiesList> createState() => CitiesListState();
}

class CitiesListState extends State<CitiesList> {
  final cityList = new Cities().getCities();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(12),
              itemCount: cityList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      child: ListTileCity(
                          cityname: cityList[index].name,
                          countryUnit: cityList[index].countryCode),

                    ),
                    Divider(
                      height: 2,
                    )
                  ],

                );
              }),
        ),
      ],
    );
  }
}
