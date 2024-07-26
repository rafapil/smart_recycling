import 'package:flutter/material.dart';

class AppButtom extends StatelessWidget {
  final double width;
  final String textoButtom;
  final TextStyle buttomStyle;
  final Color color;
  final VoidCallback function;

  const AppButtom(
      {Key? key,
      required this.width,
      required this.textoButtom,
      required this.buttomStyle,
      required this.color,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.black),
        color: color,
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 52.0,
      width: width,
      child: TextButton(
        onPressed: function,
        child: Text(textoButtom, style: buttomStyle),
      ),
    );
  }
}
