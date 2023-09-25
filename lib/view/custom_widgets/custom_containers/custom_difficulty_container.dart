import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:saba7o_app/constants/utils.dart';
import 'package:saba7o_app/view/custom_widgets/stroke_txt.dart';

import '../../../constants/app_colors.dart';

bool? isLocal;

class CustomDifficultyContainer extends StatelessWidget {
  CustomDifficultyContainer(
      {Key? key,
      required this.localPlayerImage,
      required this.worldWidePlayerImage,
      required this.level,
      required this.navigationPage,
      this.soundPath,
      required this.hasSound,
      this.local,
      this.onTap
      })
      : super(key: key);
  final String localPlayerImage;
  final String worldWidePlayerImage;
  final String level;
  String? soundPath;
  final bool hasSound;
  bool? local = AppConstants.isLocal;
  final StatefulWidget navigationPage;
  bool Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: AppColors.gold.withOpacity(.2),
      onTap: () {
        if (hasSound == true) {
          FlutterRingtonePlayer.play(fromAsset: soundPath);
        }
        Get.to(navigationPage);
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Colors.transparent,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.gold,
                                  AppColors.gold.withGreen(20)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment
                                    .bottomRight, // Gradient end position
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      AppConstants.isLocal
                          == true ? localPlayerImage : worldWidePlayerImage,
                    ),
                  ),
                ],
              )),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.gold, AppColors.gold.withGreen(20)],
                        // Gradient colors
                        begin: Alignment.centerLeft,
                        // Gradient start position
                        end: Alignment.centerRight, // Gradient end position
                      ),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Center(
                      child: StrokeText(
                          text: level,
                          txtStyle: AppConstants.myStyle,
                          strokeStyle: AppConstants.myStyleStroke)),
                ),
              ),
            ],
          )),
    );
  }
}
