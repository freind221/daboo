import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/domain/firebase_auth.dart';
import 'package:kencan/presentation/light_sign_in_filled_form_screen/light_sign_in_filled_form_screen.dart';
import 'package:kencan/presentation/light_sign_up_filled_form_screen/light_sign_up_filled_form_screen.dart';
import 'package:kencan/widgets/custom_button.dart';

class LightSignInMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 28,
                        top: 40,
                        right: 28,
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
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          left: 24,
                          top: 51,
                          right: 24,
                        ),
                        child: Text(
                          "Let’s you in",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: getFontSize(
                              32,
                            ),
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Container(
                    //     margin: getMargin(
                    //       left: 2,
                    //       top: 29,
                    //       right: 24,
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: isDark
                    //           ? ColorConstant.darkTextField
                    //           : ColorConstant.whiteA700,
                    //       borderRadius: BorderRadius.circular(
                    //         getHorizontalSize(
                    //           12.00,
                    //         ),
                    //       ),
                    //       border: Border.all(
                    //         color: isDark
                    //             ? ColorConstant.darkLine
                    //             : ColorConstant.gray300,
                    //         width: getHorizontalSize(
                    //           1.00,
                    //         ),
                    //       ),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisSize: MainAxisSize.max,
                    //       children: [
                    //         Container(
                    //           height: getSize(
                    //             32.00,
                    //           ),
                    //           width: getSize(
                    //             32.00,
                    //           ),
                    //           margin: getMargin(
                    //             top: 20,
                    //             bottom: 20,
                    //           ),
                    //           child: Card(
                    //             clipBehavior: Clip.antiAlias,
                    //             elevation: 0,
                    //             margin: EdgeInsets.all(0),
                    //             color: ColorConstant.indigo600,
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 getHorizontalSize(
                    //                   16.00,
                    //                 ),
                    //               ),
                    //             ),
                    //             child: Stack(
                    //               children: [
                    //                 Align(
                    //                   alignment: Alignment.center,
                    //                   child: Padding(
                    //                     padding: getPadding(
                    //                       left: 10,
                    //                       top: 4,
                    //                       right: 10,
                    //                       bottom: 4,
                    //                     ),
                    //                     child: CommonImageView(
                    //                       svgPath: ImageConstant.imgFacebook,
                    //                       height: getVerticalSize(
                    //                         22.00,
                    //                       ),
                    //                       width: getHorizontalSize(
                    //                         10.00,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: getPadding(
                    //             left: 16,
                    //             top: 28,
                    //             bottom: 27,
                    //           ),
                    //           // child: Text(
                    //           //   "Facebook",
                    //           //   overflow: TextOverflow.ellipsis,
                    //           //   textAlign: TextAlign.start,
                    //           //   style: TextStyle(
                    //           //     fontSize: getFontSize(
                    //           //       16,
                    //           //     ),
                    //           //     fontFamily: 'Source Sans Pro',
                    //           //     fontWeight: FontWeight.w600,
                    //           //   ),
                    //           // ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: getMargin(
                          left: 24,
                          top: 20,
                          right: 24,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? ColorConstant.darkTextField
                              : ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              12.00,
                            ),
                          ),
                          border: Border.all(
                            color: isDark
                                ? ColorConstant.darkLine
                                : ColorConstant.gray300,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            AuthMethod().signInWithGoogle(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 20,
                                  bottom: 20,
                                ),
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgGoogle,
                                  height: getVerticalSize(
                                    31.00,
                                  ),
                                  width: getHorizontalSize(
                                    30.00,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 16,
                                  top: 30,
                                  bottom: 24,
                                ),
                                child: Text(
                                  "Google",
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: getMargin(
                          left: 24,
                          top: 20,
                          right: 24,
                        ),
                        // decoration: BoxDecoration(
                        //   color: isDark
                        //       ? ColorConstant.darkTextField
                        //       : ColorConstant.whiteA700,
                        //   borderRadius: BorderRadius.circular(
                        //     getHorizontalSize(
                        //       12.00,
                        //     ),
                        //   ),
                        //   border: Border.all(
                        //     color: isDark
                        //         ? ColorConstant.darkLine
                        //         : ColorConstant.gray300,
                        //     width: getHorizontalSize(
                        //       1.00,
                        //     ),
                        //   ),
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Padding(
                            //   padding: getPadding(
                            //     top: 20,
                            //     bottom: 20,
                            //   ),
                            //   child: CommonImageView(
                            //     svgPath: ImageConstant.imgFire,
                            //     height: getVerticalSize(
                            //       32.00,
                            //     ),
                            //     width: getHorizontalSize(
                            //       26.00,
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: getPadding(
                            //     left: 18,
                            //     top: 30,
                            //     bottom: 24,
                            //   ),
                            //   child: Text(
                            //     "Apple",
                            //     overflow: TextOverflow.ellipsis,
                            //     textAlign: TextAlign.start,
                            //     style: TextStyle(

                            //       fontSize: getFontSize(
                            //         16,
                            //       ),
                            //       fontFamily: 'Source Sans Pro',
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          left: 24,
                          top: 31,
                          right: 24,
                        ),
                        child: Text(
                          "or",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: getFontSize(
                              20,
                            ),
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      width: 380,
                      text: "Sign in with password",
                      margin: getMargin(
                        left: 24,
                        top: 26,
                        right: 24,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LightSignInFilledFormScreen()),
                        );
                      },
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 24,
                    top: 0,
                    right: 24,
                    bottom: 50,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LightSignUpFilledFormScreen()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 1,
                          ),
                          child: Text(
                            "Don’t have an account?",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: isDark
                                  ? Colors.white
                                  : ColorConstant.bluegray700,
                              fontSize: getFontSize(
                                18,
                              ),
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 8,
                            top: 1,
                          ),
                          child: Text(
                            "Sign up",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorConstant.redA200,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
