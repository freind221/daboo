import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_button.dart';

class LightMatchCongratsVoneScreen extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: getVerticalSize(
                      335.00,
                    ),
                    width: getHorizontalSize(
                      342.00,
                    ),
                    margin: getMargin(
                      left: 24,
                      top: 109,
                      right: 24,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: getVerticalSize(
                              301.00,
                            ),
                            width: getHorizontalSize(
                              341.00,
                            ),
                            margin: getMargin(
                              top: 10,
                              right: 1,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: getVerticalSize(
                                      283.00,
                                    ),
                                    width: getHorizontalSize(
                                      202.00,
                                    ),
                                    margin: getMargin(
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                32.00,
                                              ),
                                            ),
                                            child: CommonImageView(
                                              imagePath:
                                                  ImageConstant.imgImage283X202,
                                              height: getVerticalSize(
                                                283.00,
                                              ),
                                              width: getHorizontalSize(
                                                202.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: getPadding(
                                              left: 4,
                                              top: 10,
                                              right: 10,
                                              bottom: 2,
                                            ),
                                            child: CommonImageView(
                                              svgPath: ImageConstant.imgVolume,
                                              height: getVerticalSize(
                                                16.00,
                                              ),
                                              width: getHorizontalSize(
                                                17.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 10,
                                      top: 10,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          32.00,
                                        ),
                                      ),
                                      child: CommonImageView(
                                        imagePath: ImageConstant.imgImage8,
                                        height: getVerticalSize(
                                          283.00,
                                        ),
                                        width: getHorizontalSize(
                                          202.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: getSize(
                                      74.00,
                                    ),
                                    width: getSize(
                                      74.00,
                                    ),
                                    margin: getMargin(
                                      all: 40,
                                    ),
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin: EdgeInsets.all(0),
                                      color: ColorConstant.whiteA700,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            37.00,
                                          ),
                                        ),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: getPadding(
                                                all: 10,
                                              ),
                                              child: Container(
                                                height: getSize(
                                                  53.00,
                                                ),
                                                width: getSize(
                                                  53.00,
                                                ),
                                                child:
                                                    CircularProgressIndicator(
                                                  value: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: getPadding(
                                                left: 24,
                                                top: 30,
                                                right: 23,
                                                bottom: 29,
                                              ),
                                              child: Text(
                                                "90%",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                     
                                                  fontSize: getFontSize(
                                                    14,
                                                  ),
                                                  fontFamily: 'Source Sans Pro',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: getPadding(
                              left: 10,
                              top: 33,
                              bottom: 33,
                            ),
                            child: CommonImageView(
                              svgPath: ImageConstant.imgClose,
                              height: getVerticalSize(
                                29.00,
                              ),
                              width: getHorizontalSize(
                                28.00,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: getPadding(
                              left: 78,
                              top: 28,
                              right: 78,
                              bottom: 28,
                            ),
                            child: CommonImageView(
                              svgPath: ImageConstant.imgVector23X23,
                              height: getSize(
                                23.00,
                              ),
                              width: getSize(
                                23.00,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: getPadding(
                              left: 77,
                              right: 77,
                              bottom: 10,
                            ),
                            child: CommonImageView(
                              svgPath: ImageConstant.imgVector,
                              height: getVerticalSize(
                                28.00,
                              ),
                              width: getHorizontalSize(
                                30.00,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: getMargin(
                      left: 24,
                      top: 60,
                      right: 24,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          getHorizontalSize(
                            40.00,
                          ),
                        ),
                        topRight: Radius.circular(
                          getHorizontalSize(
                            40.00,
                          ),
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 23,
                            top: 21,
                            right: 23,
                          ),
                          child: Text(
                            "Oh Snap!",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorConstant.redA200,
                              fontSize: getFontSize(
                                60,
                              ),
                              fontFamily: 'Pacifico',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 23,
                            top: 18,
                            right: 23,
                          ),
                          child: Text(
                            "Don't keep them waiting, say hello now!",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                               
                              fontSize: getFontSize(
                                20,
                              ),
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        CustomButton(
                          width: 380,
                          text: "Say Hello",
                          margin: getMargin(
                            top: 26,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        CustomButton(
                          width: 380,
                          text: "Keep Swiping",
                          margin: getMargin(
                            top: 16,
                          ),
                          variant: ButtonVariant.OutlineRedA200,
                          shape: ButtonShape.RoundedBorder27,
                          fontStyle:
                              ButtonFontStyle.SourceSansProSemiBold18RedA200,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
