
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientCircleAvatar extends StatelessWidget {
  final double radius;
  final Gradient gradient;
  final Widget child;

  const GradientCircleAvatar({
    required this.radius,
    required this.gradient,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      child: Container(

        height: double.infinity,
        width:  double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradient,
        ),
        child: child,
      ),
    );
  }
}