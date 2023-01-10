import 'package:kencan/presentation/accountsetupsuccessfuldialog_page/accountsetupsuccessfuldialog_page.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_button.dart';

class LightSelectIdealMatchScreen extends StatefulWidget {
  @override
  State<LightSelectIdealMatchScreen> createState() =>
      _LightSelectIdealMatchScreenState();
}

class _LightSelectIdealMatchScreenState
    extends State<LightSelectIdealMatchScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
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
                            top: 4,
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
                        Padding(
                          padding: getPadding(
                            left: 24,
                          ),
                          child: Text(
                            "Ideal Match",
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
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 24,
                        top: 40,
                        right: 24,
                      ),
                      child: Text(
                        "What are you hoping to find on the Daboo?",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 24,
                        top: 24,
                        right: 24,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: getVerticalSize(
                            183.00,
                          ),
                          crossAxisCount: 2,
                          mainAxisSpacing: getHorizontalSize(
                            24.00,
                          ),
                          crossAxisSpacing: getHorizontalSize(
                            24.00,
                          ),
                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: selectedIndex == index
                                          ? ColorConstant.redA200
                                          : isDark
                                              ? ColorConstant.darkLine
                                              : ColorConstant.bluegray50),
                                  color: isDark
                                      ? ColorConstant.darkTextField
                                      : ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomIconButton(
                                      height: 80,
                                      width: 80,
                                      margin: getMargin(
                                        left: 49,
                                        top: 24,
                                        right: 49,
                                      ),
                                      child: CommonImageView(
                                        imagePath:
                                            ImageConstant.imgAutolayouthor,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 49,
                                        top: 25,
                                        right: 49,
                                        bottom: 27,
                                      ),
                                      child: Text(
                                        "Love",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: getFontSize(
                                            18,
                                          ),
                                          fontFamily: 'Source Sans Pro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: getMargin(
                      top: 237,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? ColorConstant.darkTextField
                          : ColorConstant.whiteA700,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          getHorizontalSize(
                            24.00,
                          ),
                        ),
                        topRight: Radius.circular(
                          getHorizontalSize(
                            24.00,
                          ),
                        ),
                      ),
                      border: Border.all(
                        color: isDark
                            ? ColorConstant.darkLine
                            : ColorConstant.bluegray50,
                        width: getHorizontalSize(
                          1.00,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomButton(
                          width: 380,
                          text: "Next",
                          margin: getMargin(
                            left: 24,
                            top: 24,
                            right: 24,
                            bottom: 20,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AccountsetupsuccessfuldialogPage();
                                });
                          },
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
