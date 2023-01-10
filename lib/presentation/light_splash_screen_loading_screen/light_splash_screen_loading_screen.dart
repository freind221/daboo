import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/presentation/light_carousel_v1_one_screen/light_carousel_v1_one_screen.dart';
import 'package:kencan/widgets/spacing.dart';

class LightSplashScreenLoadingScreen extends StatefulWidget {
  @override
  State<LightSplashScreenLoadingScreen> createState() => _LightSplashScreenLoadingScreenState();
}

class _LightSplashScreenLoadingScreenState extends State<LightSplashScreenLoadingScreen> {
 
 @override
 void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_)=>LightCarouselV1OneScreen()));
    }
    );
  }
 
 
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(ImageConstant.splashScreen,
            width: size.width,
            height: size.height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SpinKitCircle(
  color: ColorConstant.redA200,
  size: getSize(80),
),
VerticalSpace(height: 100)
              ],
            )
            
          ],
        ),
      ),
    );
  }
}
