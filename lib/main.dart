import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:saba7o_app/view/pages/choose_difficulty_page.dart';
import 'package:saba7o_app/view/pages/choose_region_page.dart';
import 'package:saba7o_app/view/pages/play_page.dart';
import 'package:saba7o_app/view_model/get_palyers/get_random_player_cubit.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GetRandomPlayerCubit()..getRandomPlayer("ez/"),)
  ],child: const MyApp()
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false, home:const RegionPage(),
          theme: ThemeData.dark(),
        );
      },
    );
  }
}
//  debugShowCheckedModeBanner: false, home: PasswordGamePage()