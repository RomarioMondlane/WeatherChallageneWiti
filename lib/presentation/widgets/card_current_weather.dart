import 'package:flutter/material.dart';

class CountriesWeatherCard extends StatefulWidget {
  const CountriesWeatherCard({super.key});

  @override
  State<CountriesWeatherCard> createState() => CountriesWeatherState();
}

class CountriesWeatherState extends State<CountriesWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: <Widget>[
        Expanded(
          child: Image(image: AssetImage('assets/images/sunny.png')),
        ),
        Expanded(
          child: Text("24"),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Max: 21",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Text("Min: 12",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Text("Wind: 20%",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Text("Air Humidity: 21 Km/h",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
          ],
        )),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MAputo",
            )
          ],
        )),
      ],
    ));
  }
}
