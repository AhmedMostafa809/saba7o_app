import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:saba7o_app/constants/app_colors.dart';
import 'package:saba7o_app/constants/utils.dart';
import 'package:saba7o_app/view/custom_widgets/containers_lists/containers_lists.dart';

import '../custom_widgets/stroke_txt.dart';

class RegionPage extends StatefulWidget {
  const RegionPage({Key? key}) : super(key: key);

  @override
  State<RegionPage> createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> {
  final _regionPageController = PageController(
    viewportFraction: .3,
  );

  double _currentPage = 0.0;

  void _regionPageScrollListener() {
    setState(() {
      _currentPage = _regionPageController.page!;
    });
  }

  @override
  void initState() {
    _regionPageController.addListener(_regionPageScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _regionPageController.removeListener(_regionPageScrollListener);
    _regionPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset("assets/Group 5 (2).png",fit: BoxFit.cover,width: double.infinity,),
        Scaffold(
          backgroundColor: AppColors.backGround.withAlpha(15),
          body: Stack(
            children: [

              //shadow position
              Positioned(
                  left: 20,
                  right: 20,
                  height: size.height * .3,
                  bottom: -size.height * .2,
                  child: DecoratedBox(
                      decoration:
                          BoxDecoration(shape: BoxShape.rectangle, boxShadow: [
                    BoxShadow(
                        color: Colors.brown.shade400.withOpacity(.3),
                        blurRadius: 100,
                        offset: Offset.zero,
                        spreadRadius: .1)
                  ]))),
              //containers position
              PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _regionPageController,
                scrollDirection: Axis.vertical,
                itemCount: ContainersLists.regionContainers.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return  Center(
                        child: FittedBox(
                            child: StrokeText(
                                text: "اختار منطقه",
                                strokeStyle: AppConstants.mainFontStroke,
                                txtStyle: AppConstants.mainFont)

                        ));
                  }
                  final regionContainer =
                      ContainersLists.regionContainers[index - 1];
                  final result = _currentPage - index + 1;
                  final value = 0.3 * result + 1;
                  final opacity = value.clamp(0.0, 1.0);
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * .25,
                    ),
                    child: Transform(
                        alignment: Alignment.lerp(
                            Alignment.center, Alignment.bottomCenter, 1.5),
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..translate(
                              0.0,
                              size.height /
                                  size.height *
                                  1 *
                                  (1 - value).clamp(1, 1.2))
                          ..scale(value),
                        child: Opacity(
                            opacity: opacity, child: regionContainer)),
                  );
                },
                // Transform(transform: Matrix4.identity()..setEntry(3, 2, .001)..translate(0.0,MediaQuery.of(context).size.height/2.6.abs())..scale(value),
                //   child:
              )
            ],
          ),
        ),
      ],
    );
  }
}

