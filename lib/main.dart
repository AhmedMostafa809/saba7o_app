import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saba7o_app/view/pages/choose_region_page.dart';
import 'package:saba7o_app/view/pages/play_page.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(const MyApp());
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