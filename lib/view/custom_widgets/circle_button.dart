import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import 'gradiant_circle_avatar.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: GradientCircleAvatar(
        gradient: LinearGradient(
          colors: [AppColors.gold, AppColors.gold.withGreen(20)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        radius: 30.sp,
        child: Icon(
          icon,
          color: Colors.white,
          size: 36,
        ),
      ),
    );
  }
}