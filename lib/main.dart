import 'package:flutter/material.dart';
import 'package:weather/presentation/pages/app_Navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const AppNavigator(),
    );
  }
}
