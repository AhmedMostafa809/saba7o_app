import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saba7o_app/constants/utils.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../custom_widgets/circle_button.dart';
import '../custom_widgets/custom_circular_timer.dart';

class PasswordGamePage extends StatefulWidget {
  const PasswordGamePage({Key? key}) : super(key: key);

  @override
  _PasswordGamePageState createState() => _PasswordGamePageState();
}

class _PasswordGamePageState extends State<PasswordGamePage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;
  double progress = 1.0;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void notify() {
    if (countText == '00:00') {
      FlutterRingtonePlayer.play(fromAsset: AppSounds.timeOut);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/Group 5 (2).png",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: AppColors.backGround.withAlpha(15),
          body: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => Container(
                          decoration: const BoxDecoration(
                              // color: AppColors.backGround.withAlpha(15),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 30.h,
                          child: CupertinoTimerPicker(
                            backgroundColor: Colors.transparent,
                            mode: CupertinoTimerPickerMode.ms,
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: FractionalOffset.center,
                      children: [
                        SizedBox(
                          width: 25.h,
                          height: 25.h,
                          child: GradientCircularProgressIndicator(
                            strokeWidth: 20.0,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.gold.withGreen(50),
                                AppColors.gold.withGreen(100),
                                AppColors.gold.withGreen(100),
                                AppColors.gold.withGreen(40)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            value: progress,
                          ),
                        ),
                        Text(
                          countText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.isAnimating) {
                          controller.stop();
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          controller.reverse(
                              from: controller.value == 0
                                  ? 1.0
                                  : controller.value);
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      },
                      child: RoundButton(
                        icon:
                            isPlaying == true ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.reset();
                        setState(() {
                          isPlaying = false;
                        });
                      },
                      child: const RoundButton(
                        icon: Icons.stop,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}


