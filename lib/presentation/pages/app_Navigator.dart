import 'package:flutter/material.dart';
import 'package:weather/presentation/pages/cities_list.dart';
import 'package:weather/presentation/pages/weatherList.dart';
import 'package:weather/presentation/widgets/card_current_location_weather.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<AppNavigator> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    WeatherList(),
    CitiesList()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather State'),
        elevation: 0,
        backgroundColor: Colors.amber[200],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Cities',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[200],
        onTap: _onItemTapped,
      ),
    );
  }
}
