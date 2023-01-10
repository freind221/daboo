import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/presentation/light_inbox_voice_call_screen/light_inbox_voice_call_screen.dart';
import 'package:kencan/widgets/custom_icon_button.dart';

class LightInboxVideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isRtl = context.locale == Constants.arLocal;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CommonImageView(
                imagePath: ImageConstant.imgImage882X428,
                height: getVerticalSize(
                  882.00,
                ),
                width: getHorizontalSize(
                  428.00,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: getMargin(
                  left: 24,
                  top: 40,
                  right: 24,
                  bottom: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 4,
                            right: 10,
                          ),
                          child: CommonImageView(
                            isBackBtn: true,
                            isRtl: isRtl,
                            imagePath: ImageConstant.imgArrowleft,
                            height: getSize(
                              15.00,
                            ),
                            width: getSize(
                              15.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: getVerticalSize(
                                176.00,
                              ),
                              width: getHorizontalSize(
                                120.00,
                              ),
                              margin: getMargin(
                                left: 26,
                                top: 0,
                                right: 26,
                              ),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: getPadding(
                                        bottom: 10,
                                      ),
                                      child: CommonImageView(
                                        imagePath: ImageConstant.videoImg,
                                        height: getVerticalSize(
                                          160.00,
                                        ),
                                        width: getHorizontalSize(
                                          120.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                  CustomIconButton(
                                    height: 32,
                                    width: 32,
                                    margin: getMargin(
                                      left: 44,
                                      top: 10,
                                      right: 44,
                                    ),
                                    variant: IconButtonVariant
                                        .GradientRedA200RedA100,
                                    shape: IconButtonShape.CircleBorder16,
                                    padding: IconButtonPadding.PaddingAll9,
                                    alignment: Alignment.bottomCenter,
                                    child: CommonImageView(
                                      svgPath: ImageConstant.imgRefresh,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 26,
                              top: 19,
                              right: 26,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomIconButton(
                                  height: 80,
                                  width: 80,
                                  variant: IconButtonVariant
                                      .GradientRedA400e5Pink300e5,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgClose80X80,
                                  ),
                                ),
                                CustomIconButton(
                                  height: 80,
                                  width: 80,
                                  margin: getMargin(
                                    left: 0,
                                  ),
                                  variant: IconButtonVariant
                                      .GradientAmber600Amber200,
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LightInboxVoiceCallScreen()),
                                    );
                                  },
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgVideocamera,
                                  ),
                                ),
                                CustomIconButton(
                                  height: 80,
                                  width: 80,
                                  margin: getMargin(
                                    left: 0,
                                  ),
                                  variant:
                                      IconButtonVariant.GradientBlueA400Blue300,
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgVolume80X80,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
