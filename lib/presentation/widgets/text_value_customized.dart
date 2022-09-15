import 'package:flutter/material.dart';
import 'package:weather/data/models/response.dart';

class TextValueCustomized extends StatefulWidget {
  final String value;
  const TextValueCustomized({Key? key, required this.value}) : super(key: key);

  @override
  State<TextValueCustomized> createState() => TextValueCustomizedState();
}

class TextValueCustomizedState extends State<TextValueCustomized> {
  @override
  Widget build(BuildContext context) {
    return Text(" "+widget.value,
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.bold));
  }
}
