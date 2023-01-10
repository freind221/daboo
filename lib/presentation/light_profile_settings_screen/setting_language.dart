import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/spacing.dart';

class LightSettingsLanguageScreen extends StatefulWidget {
  @override
  State<LightSettingsLanguageScreen> createState() =>
      _LightSettingsLanguageScreenState();
}

class _LightSettingsLanguageScreenState
    extends State<LightSettingsLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
    int radioGroup = isRtl ? 1 : 0;
    return Container(
      height: getVerticalSize(500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: getVerticalSize(
              3.00,
            ),
            width: getHorizontalSize(
              56.00,
            ),
            margin: EdgeInsets.only(
              left: getHorizontalSize(
                10.00,
              ),
              top: getVerticalSize(
                16.00,
              ),
              right: getHorizontalSize(
                10.00,
              ),
            ),
            decoration: BoxDecoration(
              color:
                  isDark ? ColorConstant.darkTextField : ColorConstant.gray300,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  1.50,
                ),
              ),
            ),
          ),

          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: getPadding(
                    left: 20,
                    top: 30,
                    right: 20,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 2,
                          ),
                          child: Text(
                            "Language",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: getFontSize(
                                20,
                              ),
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ]))),
          CustomDivider(
            isDark: isDark,
          ),
          // Padding(
          //   padding: getPadding(
          //     left: 24,
          //     top: 33,
          //     right: 24,
          //   ),
          //   child: Text(
          //     "Suggested",
          //     overflow: TextOverflow.ellipsis,
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //       fontSize: getFontSize(
          //         20,
          //       ),
          //         fontFamily: "Montserrat",
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          // ),

          VerticalSpace(height: 20),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 24,
                top: 10,
                bottom: 10,
                right: 24,
              ),
              child: InkWell(
                onTap: () async {
                  setState(() async {
                    radioGroup = 0;
                    await context.setLocale(Locale("en"));
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "English (US)",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: getFontSize(
                          18,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.20,
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: ColorConstant.redA200,
                        // disabledColor: Colors.blue
                      ),
                      child: Radio(
                        value: 0,
                        activeColor: ColorConstant.redA200,
                        groupValue: radioGroup,
                        onChanged: (value) async {
                          setState(() async {
                            radioGroup = 0;
                            await context.setLocale(Locale("en"));
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 24,
                top: 10,
                bottom: 10,
                right: 24,
              ),
              child: InkWell(
                onTap: () async {
                  setState(() async {
                    radioGroup = 1;
                    await context.setLocale(Locale("ar"));
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "العربية",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: getFontSize(
                          18,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.20,
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: ColorConstant.redA200,
                        // disabledColor: Colors.blue
                      ),
                      child: Radio(
                        value: 1,
                        activeColor: ColorConstant.redA200,
                        groupValue: radioGroup,
                        onChanged: (value) {
                          setState(() async {
                            radioGroup = value as int;
                            await context.setLocale(Locale("ar"));
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
