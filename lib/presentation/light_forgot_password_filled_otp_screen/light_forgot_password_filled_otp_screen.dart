import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/presentation/light_reset_password_filled_form_screen/light_reset_password_filled_form_screen.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LightForgotPasswordFilledOtpScreen extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: size.width,
                    margin: getMargin(
                      left: 28,
                      top: 38,
                      right: 28,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 2,
                            bottom: 0,
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
                            right: 24
                          ),
                          child: Text(
                            "Forgot Password",
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
                        top: 247,
                        right: 24,
                      ),
                      child: Text(
                        "Code has been send to +6282******39",
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
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 63,
                      right: 24,
                    ),
                    child: Container(
                      width: getHorizontalSize(
                        380.00,
                      ),
                      height: getVerticalSize(
                        80.00,
                      ),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        backgroundColor: Colors.transparent,
                        obscureText: false,
                        obscuringCharacter: '*',
                        keyboardType: TextInputType.number,
                        autoDismissKeyboard: true,
                        enableActiveFill: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {},
                        textStyle: TextStyle(
                             
                          fontSize: getFontSize(
                            29,
                          ),
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w600,
                        ),
                        pinTheme: PinTheme(
                          fieldHeight: getHorizontalSize(
                            68.00,
                          ),
                          fieldWidth: getHorizontalSize(
                            83.00,
                          ),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              20.00,
                            ),
                          ),
                          selectedFillColor:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
                          activeFillColor:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
                          inactiveFillColor:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
                          inactiveColor:isDark?ColorConstant.darkLine: ColorConstant.bluegray50,
                          selectedColor: ColorConstant.redA200,
                          activeColor:isDark?ColorConstant.darkLine: ColorConstant.bluegray50,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: getMargin(
                        left: 24,
                        top: 64,
                        right: 24,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Resend code in ',
                              style: TextStyle(
                                   color: isDark?Colors.white:Colors.black,
                                fontSize: getFontSize(
                                  16,
                                ),
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '56',
                              style: TextStyle(
                                color: ColorConstant.redA200,
                                fontSize: getFontSize(
                                  16,
                                ),
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' s',
                              style: TextStyle(
                                   
                                fontSize: getFontSize(
                                  16,
                                ),
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  CustomButton(
                    width: 380,
                    text: "Verify",
                    margin: getMargin(
                      left: 24,
                      top: 239,
                      right: 24,
                      bottom: 20,
                    ),
                    onTap: (){
                      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)
       =>LightResetPasswordFilledFormScreen()),
        );
                    },
                    alignment: Alignment.center,
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
