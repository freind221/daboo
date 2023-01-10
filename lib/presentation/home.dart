import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/presentation/light_home_photos_four_screen/light_home_photos_four_screen.dart';
import 'package:kencan/presentation/light_inbox_screen/light_inbox_screen.dart';
import 'package:kencan/presentation/light_maps_vtwo_screen/light_maps_vtwo_screen.dart';
import 'package:kencan/presentation/light_match_screen/light_match_screen.dart';
import 'package:kencan/presentation/light_profile_settings_screen/light_profile_settings_screen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Home extends StatefulWidget {
  static String id = "HomeScreen";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    LightHomePhotosFourScreen(),
    //LightMapsVtwoScreen(),
    LightMatchScreen(),
    LightInboxScreen(),
    LightProfileSettingsScreen(),
  ];

  int selectedNavBarIndex = 0;

  bool pop = false;
  // int selected=0;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: isDark ? ColorConstant.darkBg : Colors.white,
        items: [
          AnimatedBarItems(
              icon: Container(
                padding: getPadding(all: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstant.redA20033),
                child: Icon(
                  Icons.home,
                  color: ColorConstant.redA200,
                ),
              ),
              selectedIcon: Container(
                  padding: getPadding(all: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConstant.redA200),
                  child: Icon(Icons.home)),
              selectedColor: ColorConstant.whiteA700,
              backgroundColor: ColorConstant.redA20033,
              title: Text('')),
          // AnimatedBarItems(
          //     icon: Container(
          //       padding: getPadding(all: 8),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: ColorConstant.redA20033),
          //       child: Icon(
          //         Icons.map_rounded,
          //         color: ColorConstant.redA200,
          //       ),
          //     ),
          //     selectedIcon: Container(
          //         padding: getPadding(all: 8),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             color: ColorConstant.redA200),
          //         child: Icon(Icons.map_rounded)),
          //     selectedColor: ColorConstant.whiteA700,
          //     backgroundColor: ColorConstant.redA20033,
          //     title: Text('')),
          AnimatedBarItems(
              icon: Container(
                padding: getPadding(all: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstant.redA20033),
                child: Icon(
                  Icons.favorite_rounded,
                  color: ColorConstant.redA200,
                ),
              ),
              selectedIcon: Container(
                  padding: getPadding(all: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConstant.redA200),
                  child: Icon(Icons.favorite_rounded)),
              selectedColor: ColorConstant.whiteA700,
              backgroundColor: ColorConstant.redA20033,
              title: Text('')),
          AnimatedBarItems(
              icon: Container(
                padding: getPadding(all: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstant.redA20033),
                child: Icon(
                  Icons.chat_rounded,
                  color: ColorConstant.redA200,
                ),
              ),
              selectedIcon: Container(
                  padding: getPadding(all: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConstant.redA200),
                  child: Icon(Icons.chat_rounded)),
              selectedColor: ColorConstant.whiteA700,
              backgroundColor: ColorConstant.redA20033,
              title: Text('')),
          AnimatedBarItems(
              icon: Container(
                padding: getPadding(all: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstant.redA20033),
                child: Icon(
                  Icons.person_rounded,
                  color: ColorConstant.redA200,
                ),
              ),
              selectedIcon: Container(
                  padding: getPadding(all: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConstant.redA200),
                  child: Icon(Icons.person_rounded)),
              selectedColor: ColorConstant.whiteA700,
              backgroundColor: ColorConstant.redA20033,
              title: Text('')),
        ],
        borderRadius: BorderRadius.circular(20),
        iconSize: 26,
        bubbleFillStyle: BubbleFillStyle.fill,
        elevation: 8,
        barStyle: BubbleBarStyle.vertical,
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.simple,
        opacity: 0.3,
        currentIndex: selectedNavBarIndex,
        onTap: (index) {
          setState(() {
            selectedNavBarIndex = index as int;
          });
        },
      ),
      body: SafeArea(
        child: WillPopScope(
            onWillPop: () async {
              return (await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text(
                              "Are you sure",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Source Sans Pro',
                              ),
                            ),
                            title: Text(
                              "Do you want to exit the app?",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Source Sans Pro',
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    color: isDark ? Colors.white : Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Source Sans Pro',
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                    fontFamily: 'SF Pro Display',
                                  ),
                                ),
                              ),
                            ],
                          ))) ??
                  false;
            },
            child: screens[selectedNavBarIndex]),
      ),
    );
  }
}
