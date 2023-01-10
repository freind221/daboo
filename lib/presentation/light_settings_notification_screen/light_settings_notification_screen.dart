import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_switch.dart';
import 'package:kencan/widgets/spacing.dart';

class LightSettingsNotificationScreen extends StatefulWidget {
  @override
  State<LightSettingsNotificationScreen> createState() => _LightSettingsNotificationScreenState();
}

class _LightSettingsNotificationScreenState extends State<LightSettingsNotificationScreen> {
  bool switchVal1=true;
  bool switchVal2=true;
  bool switchVal3=false;
  bool switchVal4=false;

  @override
 Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
bool isRtl = context.locale==Constants.arLocal;
    return Scaffold(
     
      body: SafeArea(
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width,
                    margin: getMargin(
                      left: 28,
                      top: 35,
                      right: 28,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 5,
                            bottom: 5,
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
                        HorizontalSpace(width: 20),
                        Padding(
                          padding: getPadding(
                            left: 0,
                          ),
                          child: Text(
                            "Notification",
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
                      ],
                    ),
                  ),
                  VerticalSpace(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: (){
                          setState(() {
                                switchVal1=!switchVal1;
                              });
                      },
                      child: Padding(
                        padding: getPadding(
                          left: 24,
                          top: 10,
                          bottom: 10,
                          right: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 8,
                                bottom: 7,
                              ),
                              child: Text(
                                "Sound",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                     
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            CustomSwitch(
                              value: switchVal1,
                              onChanged: (value) {
                                setState(() {
                                  switchVal1=!switchVal1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                CustomDivider(isDark: isDark),
            
                 
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: (){
                         setState(() {
                                switchVal2=!switchVal2;
                              });
                      },
                      child: Padding(
                        padding: getPadding(
                          left: 24,
                          top: 10,
                          bottom: 10,
                          right: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 8,
                                bottom: 7,
                              ),
                              child: Text(
                                "Vibrate",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                     
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            CustomSwitch(
                              value: switchVal2,
                              onChanged: (value) {
                                setState(() {
                                  switchVal2=!switchVal2;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                 CustomDivider(isDark: isDark),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                       onTap: (){
                         setState(() {
                                switchVal3=!switchVal3;
                              });
                      },
                      child: Padding(
                        padding: getPadding(
                          left: 24,
                          top: 10,
                          bottom: 10,
                          right: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 10,
                                bottom: 4,
                              ),
                              child: Text(
                                "New tips available",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                     
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            CustomSwitch(
                              value: switchVal3,
                              onChanged: (value) {
                                  setState(() {
                                  switchVal3=!switchVal3;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                 CustomDivider(isDark: isDark),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                       onTap: (){
                         setState(() {
                                switchVal4=!switchVal4;
                              });
                      },
                      child: Padding(
                        padding: getPadding(
                          left: 24,
                          top: 10,
                      
                          right: 24,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 8,
                                bottom: 7,
                              ),
                              child: Text(
                                "New service available",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                     
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            CustomSwitch(
                              value: switchVal4,
                              onChanged: (value) {
                                  setState(() {
                                  switchVal4=!switchVal4;
                                });
                              },
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
        ),
      ),
    );
  }
}
