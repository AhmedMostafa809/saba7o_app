import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saba7o_app/constants/utils.dart';
import 'package:saba7o_app/view/custom_widgets/custom_containers/custom_button.dart';
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
    if (controller.isDismissed) {
      FlutterRingtonePlayer.play(asAlarm: true, fromAsset: AppSounds.timeOut);
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

  //firebase

  final FirebaseStorage storage = FirebaseStorage.instance;
  String imageUrl = '';
  String imageName = '';
  bool isLoading = false;

  Future<Map<String, String>> getRandomImage() async {
    setState(() {
      isLoading = true;
    });

    try {
      final storageRef = storage.ref().child('ez/');
      final ListResult result = await storageRef.listAll();

      if (result.items.isEmpty) {
        setState(() {
          isLoading = false;
        });
      }
      final randomIndex = Random().nextInt(result.items.length);
      final imageRef = result.items[randomIndex];
      final imageUrl = await imageRef.getDownloadURL();
      final imageNameWithExtension = imageRef.name;
      final parts = imageNameWithExtension.split('.');
      final baseName = parts[0];

      setState(() {
        isLoading = false;
        this.imageUrl = imageUrl;
        this.imageName = baseName;
      });

      return {'url': imageUrl, 'name': baseName};
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching image: $e');
      return {'url': '', 'name': ''};
    }
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
        SafeArea(

          child: Scaffold(
            backgroundColor: AppColors.backGround.withAlpha(15),
            body: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [ // Add some spacing
                    isLoading
                        ? CircularProgressIndicator()
                        : imageUrl.isNotEmpty
                            ? Column(
                                children: [
                                  Text(
                                   imageName,
                                    style: AppConstants.mainFont,
                                  ),
                                  Container(
                                    height: 30.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              imageUrl,
                                            ),
                                            fit: BoxFit.contain),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.gold,
                                            AppColors.gold.withGreen(20)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment
                                              .bottomRight, // Gradient end position
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16))),

                                  ),

                                ],
                              )
                            : Text('Press the button'),


                  ],
                ),

                CustomButton(txt: "Change", width: 70.w, height: 7.h, clr1: AppColors.gold, clr2: AppColors.gold.withGreen(50),onTap: (){
                  setState(() {});
                  getRandomImage();
                },),

                Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                  GestureDetector(
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
                  Padding(
                    padding:
                     EdgeInsets.only(right: 10.w,left: 10.w, top: 4.h),
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
                  ],),

              ],

            ),
          ),
        ),
      ],
    );
  }
}
