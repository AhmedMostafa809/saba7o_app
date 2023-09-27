import 'package:flutter/material.dart';
import '../../../constants/utils.dart';
import '../stroke_txt.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.onTap,
      required this.txt,
      required this.width,
      required this.height,
      required this.clr1,
      required this.clr2})
      : super(key: key);

  final void Function()? onTap;
  final String txt;
  final double width, height;
  final Color clr1, clr2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [clr1, clr2],
              // Gradient colors
              begin: Alignment.centerLeft,
              // Gradient start position
              end: Alignment.centerRight, // Gradient end position
            ),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Center(
            child: StrokeText(
                text: txt,
                txtStyle: AppConstants.myStyle,
                strokeStyle: AppConstants.myStyleStroke)),
      ),
    );
  }
}
