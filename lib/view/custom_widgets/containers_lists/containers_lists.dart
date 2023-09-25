import 'package:flutter/material.dart';
import 'package:saba7o_app/constants/utils.dart';
import 'package:saba7o_app/view/custom_widgets/custom_containers/custom_region_container.dart';
import 'package:saba7o_app/view/custom_widgets/custom_containers/custom_difficulty_container.dart';
import 'package:saba7o_app/view/custom_widgets/stroke_txt.dart';
import 'package:saba7o_app/view/pages/choose_difficulty_page.dart';
import 'package:saba7o_app/view/pages/play_page.dart';

class ContainersLists {
   static List<Widget>  regionContainers= [
     Center(
         child: FittedBox(
             child: StrokeText(
                 text: "اختار منطقه",
                 strokeStyle: AppConstants.mainFontStroke,
                 txtStyle: AppConstants.mainFont)

         )),
     CustomRegionContainer(
       hasSound: true,
       navigationPage: const ChooseDifficultyPage(),
       playerImage: AppAssets.worldWide,
       local: false,
       level: "Worldwide",
       soundPath: AppSounds.worldWide,
       ),
     CustomRegionContainer(
       hasSound: true,
       local: true,
       playerImage: AppAssets.egyptianLeague,
       level: "Egyptian League",
       navigationPage: const ChooseDifficultyPage(),
       soundPath: AppSounds.egyptianLeague,
     ),
  ];


  static List<Widget> difficultyContainers = [
    Center(
        child: FittedBox(
            child: StrokeText(
                text: "اختار مستوى",
                strokeStyle: AppConstants.mainFontStroke,
                txtStyle: AppConstants.mainFont)
            // Text("اختار مستوى", style: AppConstants.mainFont),
            )),
    CustomDifficultyContainer(
      hasSound: true,
      navigationPage: const PasswordGamePage(),
      worldWidePlayerImage: AppAssets.WWEz,
      localPlayerImage: AppAssets.EEz,
      level: "Easy",
      soundPath: AppSounds.EZ,

    ),
    CustomDifficultyContainer(
      hasSound: true,
      worldWidePlayerImage: AppAssets.WWM,
      localPlayerImage: AppAssets.EM,
      level: "Medium",
      navigationPage: const PasswordGamePage(),
      soundPath: AppSounds.Mid,
    ),
    CustomDifficultyContainer(
      hasSound: true,
      worldWidePlayerImage: AppAssets.WWH,
      localPlayerImage: AppAssets.EH,
      level: "Hard",
      navigationPage: const PasswordGamePage(),
      soundPath: AppSounds.Hard,
    ),
  ];

}
