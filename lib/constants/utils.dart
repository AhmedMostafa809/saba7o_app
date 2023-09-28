// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class AppConstants {
  static var player = AudioPlayer();
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
    fontSize: 50.sp,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black87,
  );
  static TextStyle mainFont = GoogleFonts.lalezar(
      fontSize: 50.sp, fontWeight: FontWeight.w400, color: Colors.white);
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
  static String worldWide = "asset:assets/messi.mp3";
  static String egyptianLeague = "asset:assets/wtf.mp3";
  static String EZ = "asset:assets/EZ.mp3";
  static String Mid = "asset:assets/Mid.mp3";
  static String Hard = "asset:assets/Hard.mp3";
  static String timeOut = "asset:assets/TimeOut.mp3";

}