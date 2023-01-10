import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kencan/Utilis/utilis.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/domain/firebase_auth.dart';
import 'package:kencan/presentation/home.dart';
import 'package:kencan/presentation/light_forgot_password_method_screen/light_forgot_password_method_screen.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/custom_checkbox.dart';
import 'package:kencan/widgets/custom_text_form_field.dart';

import '../light_sign_up_filled_form_screen/light_sign_up_filled_form_screen.dart';

class LightSignInFilledFormScreen extends StatefulWidget {
  @override
  State<LightSignInFilledFormScreen> createState() =>
      _LightSignInFilledFormScreenState();
}

class _LightSignInFilledFormScreenState
    extends State<LightSignInFilledFormScreen> {
  bool checkbox = false;

  bool obscure1 = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: getMargin(
                  left: 24,
                  top: 24,
                  right: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImageConstant.inPagesLogo,
                      width: getHorizontalSize(197),
                      height: getVerticalSize(190),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          left: 24,
                          top: 50,
                          right: 24,
                        ),
                        child: Text(
                          "Let’s Sign You In",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: getFontSize(
                              29,
                            ),
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        margin: getMargin(
                          left: 24,
                          top: 36,
                          right: 24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              2.00,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: getPadding(
                                  left: 0,
                                  top: 1,
                                  right: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "Email",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.bluegray800A2,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontFamily: 'Source Sans Pro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        "*",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.redA700A2,
                                          fontSize: getFontSize(
                                            14,
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
                            CustomTextFormField(
                              controller: emailController,
                              isDark: isDark,
                              width: 380,
                              focusNode: FocusNode(),
                              hintText: "example@yourdomain.com",
                              margin: getMargin(
                                top: 11,
                              ),
                              padding: TextFormFieldPadding.PaddingT18,
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        margin: getMargin(
                          left: 24,
                          top: 20,
                          right: 24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              2.00,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: getPadding(
                                  left: 0,
                                  top: 1,
                                  right: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "Password",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.bluegray800A2,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontFamily: 'Source Sans Pro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        "*",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.redA700A2,
                                          fontSize: getFontSize(
                                            14,
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
                            CustomTextFormField(
                              controller: passwordController,
                              isDark: isDark,
                              width: 380,
                              focusNode: FocusNode(),
                              hintText: "*************",
                              margin: getMargin(
                                top: 11,
                              ),
                              textInputAction: TextInputAction.done,
                              alignment: Alignment.centerLeft,
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscure1 = !obscure1;
                                  });
                                },
                                child: Padding(
                                  padding: getPadding(left: 14, right: 14),
                                  child: Container(
                                    height: getSize(
                                      24.17,
                                    ),
                                    width: getSize(
                                      24.67,
                                    ),
                                    child: obscure1
                                        ? SvgPicture.asset(
                                            ImageConstant.visibilityOff,
                                            color: ColorConstant.bluegray400,
                                          )
                                        : SvgPicture.asset(
                                            ImageConstant.visibilityOn,
                                            color: ColorConstant.bluegray400,
                                          ),
                                  ),
                                ),
                              ),
                              suffixConstraints: BoxConstraints(
                                minWidth: getHorizontalSize(
                                  20.00,
                                ),
                                minHeight: getVerticalSize(
                                  18.00,
                                ),
                              ),
                              isObscureText: obscure1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomCheckbox(
                        alignment: Alignment.centerLeft,
                        text: "Remember me",
                        value: checkbox,
                        padding: getPadding(
                          left: 48,
                          top: 22,
                          right: 48,
                        ),
                        onChange: (value) {
                          checkbox = value;
                          setState(() {});
                        },
                      ),
                    ),
                    CustomButton(
                      width: 380,
                      text: "Sign in",
                      margin: getMargin(
                        left: 24,
                        top: 22,
                        right: 24,
                      ),
                      onTap: () {
                        if (emailController.text != '' &&
                            passwordController.text != '') {
                          AuthMethod()
                              .loginUser(emailController.text,
                                  passwordController.text, context)
                              .then((value) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => Home()),
                                (Route<dynamic> route) => false);
                          });
                        } else {
                          Utilis.toatsMessage("Some Fields are empty");
                        }
                      },
                      alignment: Alignment.center,
                    ),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Padding(
                    //     padding: getPadding(
                    //       left: 24,
                    //       top: 26,
                    //       right: 24,
                    //     ),
                    //     child: InkWell(
                    //       onTap: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) =>
                    //                   LightForgotPasswordMethodScreen()),
                    //         );
                    //       },
                    //       child: Text(
                    //         "Forgot the password?",
                    //         overflow: TextOverflow.ellipsis,
                    //         textAlign: TextAlign.start,
                    //         style: TextStyle(
                    //           color: ColorConstant.redA200,
                    //           fontSize: getFontSize(
                    //             16,
                    //           ),
                    //           fontFamily: 'Source Sans Pro',
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          left: 24,
                          top: 36,
                          right: 24,
                        ),
                        child: Text(
                          "or continue with",
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
                          top: 27,
                          right: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              //width: getHorizontalSize(180),
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
                              //         : ColorConstant.bluegray50,
                              //     width: getHorizontalSize(
                              //       1.00,
                              //     ),
                              //   ),
                              // ),
                              child: Padding(
                                padding: getPadding(
                                  left: 12,
                                  top: 20,
                                  right: 12,
                                  bottom: 20,
                                ),
                                // child: Text(
                                //   "Facebook",
                                //   overflow: TextOverflow.ellipsis,
                                //   textAlign: TextAlign.start,
                                //   style: TextStyle(
                                //     fontSize: getFontSize(
                                //       16,
                                //     ),
                                //     fontFamily: 'Source Sans Pro',
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                              ),
                            ),
                            Container(
                              width: getHorizontalSize(180),
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
                                      : ColorConstant.bluegray50,
                                  width: getHorizontalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  AuthMethod()
                                      .signInWithGoogle(context)
                                      .then((value) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LightSignInFilledFormScreen()),
                                    );
                                  }).onError((error, stackTrace) {
                                    Utilis.toatsMessage(error.toString());
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        left: 0,
                                        top: 16,
                                        bottom: 16,
                                      ),
                                      child: CommonImageView(
                                        svgPath: ImageConstant.imgGoogle,
                                        height: getVerticalSize(
                                          24.00,
                                        ),
                                        width: getHorizontalSize(
                                          23.00,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 12,
                                        top: 23,
                                        right: 1,
                                        bottom: 16,
                                      ),
                                      child: Text(
                                        "Google",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.black900,
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
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          left: 24,
                          top: 36,
                          right: 24,
                          bottom: 48,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
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
                                  bottom: 3,
                                ),
                                child: Text(
                                  "Don’t have an account?",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: isDark
                                        ? Colors.white
                                        : ColorConstant.bluegray400,
                                    fontSize: getFontSize(
                                      16,
                                    ),
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 8,
                                  top: 2,
                                ),
                                child: Text(
                                  "Sign up",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorConstant.redA200,
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
