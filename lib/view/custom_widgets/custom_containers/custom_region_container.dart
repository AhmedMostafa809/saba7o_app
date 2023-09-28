import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:saba7o_app/constants/utils.dart';
import 'package:saba7o_app/view/custom_widgets/stroke_txt.dart';

import '../../../constants/app_colors.dart';

class CustomRegionContainer extends StatelessWidget {
  CustomRegionContainer(
      {Key? key,
        required this.local,
        required this.playerImage,
        required this.level,
        required this.navigationPage,
        this.soundPath,
        required this.hasSound,

      })
      : super(key: key);
  final String playerImage;
  final String level;
  String? soundPath;
  final bool hasSound;
  final StatefulWidget navigationPage;
  bool local;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: AppColors.gold.withOpacity(.2),
      onTap: () {
        AppConstants.isLocal= local;
        if (hasSound == true) {
        //   FlutterRingtonePlayer.play(
        //       asAlarm: true,
        //
        //       fromAsset: soundPath);
          AppConstants.player.setUrl(soundPath!);
          AppConstants.player.play();
          Get.to(navigationPage);
        }

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
                                    // Gradient colors
                                    begin: Alignment.topLeft,
                                    // Gradient start position
                                    end: Alignment
                                        .bottomRight, // Gradient end position
                                  ),
                                  // color: Colors.red,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16))),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Image.asset(
                          playerImage
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
