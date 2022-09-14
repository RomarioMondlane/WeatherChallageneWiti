import 'package:flutter/material.dart';

class ListTileCity extends StatefulWidget {
  final String cityname;
  final String countryUnit;
  const ListTileCity(
      {super.key, required this.cityname, required this.countryUnit});

  @override
  State<ListTileCity> createState() => ListTileCityState();
}

class ListTileCityState extends State<ListTileCity> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.cityname,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.bold)),
      trailing: Text(widget.countryUnit,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.bold)),
    );
  }
}
