import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/presentation/light_inbox_video_call_screen/light_inbox_video_call_screen.dart';
import 'package:kencan/widgets/custom_icon_button.dart';

class LightInboxVoiceCallScreen extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
bool isRtl = context.locale==Constants.arLocal;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 28,
                    top: 40,
                    right: 28,
                  ),
                  child: CommonImageView(
                    isRtl: isRtl,
                    isBackBtn: true,
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 28,
                      top: 0,
                      right: 28,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          100.00,
                        ),
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgImage200X200,
                        height: getSize(
                          200.00,
                        ),
                        width: getSize(
                          200.00,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 28,
                      top: 21,
                      right: 28,
                    ),
                    child: Text(
                      "Jenny Wilson",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                           
                        fontSize: getFontSize(
                          26,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 28,
                      top: 20,
                      right: 28,
                    ),
                    child: Text(
                      "03:37 minutes",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstant.bluegray800A3,
                        fontSize: getFontSize(
                          18,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
           
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(
                  left: 28,
                  top: 0,
                  right: 28,
                  bottom: 48,
                ),
                child: Container(
                  width: getHorizontalSize(300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomIconButton(
                        height: 80,
                        width: 80,
                        variant:
                            IconButtonVariant.GradientRedA400e5Pink300e5,
                            onTap: (){
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
                        variant: IconButtonVariant.GradientAmber600Amber200,
                        onTap: (){
                          Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(builder: (context)
                                              =>LightInboxVideoCallScreen()),
                                                );
                        },
                        child: CommonImageView(
                          svgPath: ImageConstant.imgUpload,
                        ),
                      ),
                      CustomIconButton(
                        height: 80,
                        width: 80,
                        margin: getMargin(
                          left: 0,
                        ),
                        variant: IconButtonVariant.GradientBlueA400Blue300,
                        child: CommonImageView(
                          svgPath: ImageConstant.imgVolume80X80,
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
    );
  }
}
