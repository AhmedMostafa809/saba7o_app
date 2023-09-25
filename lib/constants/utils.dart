// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class AppConstants {

  static bool? isLocal;




  static TextStyle myStyleStroke = GoogleFonts.lilitaOne(
    fontSize: 20.sp,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black87,
  );
  static TextStyle myStyle = GoogleFonts.lilitaOne(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.fontColor
  );




  static TextStyle mainFontStroke = GoogleFonts.lalezar(
    fontSize: 40,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black87,
  );
  static TextStyle mainFont = GoogleFonts.lalezar(
      fontSize: 40, fontWeight: FontWeight.w400, color: Colors.white);
}


class AppAssets{
  static String worldWide = "assets/earth.png";
  static String egyptianLeague = "assets/egyptianL.png";
  static String WWEz = "assets/flex.png";
  static String WWM = "assets/messi.png";
  static String WWH = "assets/mar3y.png";
  static String EEz = "assets/22.png";
  static String EM = "assets/zizo.png";
  static String EH = "assets/ElOsta.png";

}


class AppSounds{
  static String worldWide = "assets/messi.mp3";
  static String egyptianLeague = "assets/wtf.mp3";
  static String EZ = "assets/EZ.mp3";
  static String Mid = "assets/Mid.mp3";
  static String Hard = "assets/Hard.mp3";
  static String timeOut = "assets/TimeOut.mp3";

}