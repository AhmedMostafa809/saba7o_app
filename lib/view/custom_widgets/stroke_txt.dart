import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/utils.dart';

class StrokeText extends StatelessWidget {
  const StrokeText(
      {Key? key,
      required this.text,
      required this.txtStyle,
      required this.strokeStyle})
      : super(key: key);
  final String text;
  final TextStyle txtStyle;
  final TextStyle strokeStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(text, style: strokeStyle),
        Text(
          text,
          style: txtStyle,
        ),
      ],
    );
  }
}
