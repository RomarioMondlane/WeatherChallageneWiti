import 'package:flutter/material.dart';
import 'package:weather/data/models/response.dart';

class TextKeyCustomized extends StatefulWidget {
  final String text;
  const TextKeyCustomized({Key? key, required this.text}) : super(key: key);

  @override
  State<TextKeyCustomized> createState() => TextKeyCustomizedState();
}

class TextKeyCustomizedState extends State<TextKeyCustomized> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.bold));
  }
}
