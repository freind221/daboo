import 'package:kencan/presentation/light_forgot_password_filled_otp_screen/light_forgot_password_filled_otp_screen.dart';
import 'package:kencan/widgets/spacing.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_button.dart';

class LightForgotPasswordMethodScreen extends StatefulWidget {
  @override
  State<LightForgotPasswordMethodScreen> createState() => _LightForgotPasswordMethodScreenState();
}

class _LightForgotPasswordMethodScreenState extends State<LightForgotPasswordMethodScreen> {
  bool isEmailSelected=true;

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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        top: 31,
                        right: 24,
                      ),
                      child: CommonImageView(
                        svgPath: ImageConstant.imgFrame220X280,
                        height: getVerticalSize(
                          220.00,
                        ),
                        width: getHorizontalSize(
                          280.00,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getHorizontalSize(
                        370.00,
                      ),
                      margin: getMargin(
                        left: 24,
                        top: 30,
                        right: 24,
                      ),
                      child: Text(
                        "Select which contact details should we use to reset your password",
                        maxLines: null,
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
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isEmailSelected=true;
                        });
                      },

                      child: Container(
                        width: double.infinity,
                        margin: getMargin(
                          left: 20,
                          top: 30,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              8.00,
                            ),
                          ),
                          border: Border.all(
                            color:
                            isDark?ColorConstant.darkLine:ColorConstant.bluegray50,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child:isEmailSelected?
                         OutlineGradientButton(
                            padding: EdgeInsets.only(
            left: getHorizontalSize(
              2.00,
            ),
            top: getVerticalSize(
              2.00,
            ),
            right: getHorizontalSize(
              2.00,
            ),
            bottom: getVerticalSize(
              2.00,
            ),
          ),
          strokeWidth: getHorizontalSize(
            2.00,
          ),
          gradient: LinearGradient(
            begin: Alignment(
              1,
              1.0024292469024658,
            ),
            end: Alignment(
              0,
              0.0024292469024658203,
            ),
            colors: [
              ColorConstant.redA200,
              ColorConstant.redA100,
            ],
          ),
          corners: Corners(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
            bottomLeft: Radius.circular(
              20,
            ),
            bottomRight: Radius.circular(
              20,
            ),
          ),
                           child: Row(
                             children: [
                              Image.asset(
                                ImageConstant.email,
                                height: getVerticalSize(80),
                                width: getHorizontalSize(80),
                              ),
                              HorizontalSpace(width: 16),
                               Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      left: 0,
                                      top: 16,
                                      right: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                      
                                     
                                        
                                      
                                        Padding(
                                          padding: getPadding(
                                            left: 0,
                                          ),
                                          child: Text(
                                            "Via email",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.bluegray50,
                                              fontSize: getFontSize(
                                                16,
                                              ),
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w600,
                                              height: 1.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: getHorizontalSize(
                                      263.00,
                                    ),
                                    margin: getMargin(
                                      left: 0,
                                      top: 10,
                                      right: 0,
                                      bottom: 18,
                                    ),
                                    child: Text(
                                      "ex***le@yourdomain.com",
                                      maxLines: null,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: ColorConstant.bluegray400,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w400,
                                        height: 1.43,
                                      ),
                                    ),
                                  ),
                                ],
                                                     ),
                           
                           
                             ],
                           ),
                         ):
                      
                        Row(
                          children: [
                            Image.asset(
                                ImageConstant.email,
                                height: getVerticalSize(80),
                                width: getHorizontalSize(80),
                              ),
                              HorizontalSpace(width: 16),
                            Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      left: 0,
                                      top: 16,
                                      right: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                      
                                     
                                        
                                      
                                        Padding(
                                          padding: getPadding(
                                            left: 0,
                                          ),
                                          child: Text(
                                            "Via email",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.bluegray50,
                                              fontSize: getFontSize(
                                                16,
                                              ),
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w600,
                                              height: 1.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: getHorizontalSize(
                                      263.00,
                                    ),
                                    margin: getMargin(
                                      left: 0,
                                      top: 10,
                                      right: 0,
                                      bottom: 18,
                                    ),
                                    child: Text(
                                      "ex***le@yourdomain.com",
                                      maxLines: null,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: ColorConstant.bluegray400,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w400,
                                        height: 1.43,
                                      ),
                                    ),
                                  ),
                                ],
                                                     ),
                           
                          
                          ],
                        ),
                      
                      ),
                    ),
                  ),
                
                   Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isEmailSelected=false;
                        });
                      },

                      child: Container(
                        width: double.infinity,
                        margin: getMargin(
                          left: 20,
                          top: 30,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              8.00,
                            ),
                          ),
                          border: Border.all(
                            color:
                            isDark?ColorConstant.darkLine:ColorConstant.bluegray50,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child:isEmailSelected?
                          Row(
                          children: [
                            Image.asset(
                                ImageConstant.phone,
                                height: getVerticalSize(80),
                                width: getHorizontalSize(80),
                              ),
                              HorizontalSpace(width: 16),
                             Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      left: 0,
                                      top: 16,
                                      right: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                      
                                     
                                        
                                      
                                        Padding(
                                          padding: getPadding(
                                            left: 0,
                                          ),
                                          child: Text(
                                            "Via phone",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.bluegray50,
                                              fontSize: getFontSize(
                                                16,
                                              ),
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w600,
                                              height: 1.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: getHorizontalSize(
                                      263.00,
                                    ),
                                    margin: getMargin(
                                      left: 0,
                                      top: 10,
                                      right: 0,
                                      bottom: 18,
                                    ),
                                    child: Text(
                                      "+6282******39",
                                      maxLines: null,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: ColorConstant.bluegray400,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w400,
                                        height: 1.43,
                                      ),
                                    ),
                                  ),
                                ],
                                                     ),
                           
                         
                          ],
                        )
                      :OutlineGradientButton(
                            padding: EdgeInsets.only(
            left: getHorizontalSize(
              2.00,
            ),
            top: getVerticalSize(
              2.00,
            ),
            right: getHorizontalSize(
              2.00,
            ),
            bottom: getVerticalSize(
              2.00,
            ),
          ),
          strokeWidth: getHorizontalSize(
            2.00,
          ),
          gradient: LinearGradient(
            begin: Alignment(
              1,
              1.0024292469024658,
            ),
            end: Alignment(
              0,
              0.0024292469024658203,
            ),
            colors: [
              ColorConstant.redA200,
              ColorConstant.redA100,
            ],
          ),
          corners: Corners(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
            bottomLeft: Radius.circular(
              20,
            ),
            bottomRight: Radius.circular(
              20,
            ),
          ),
                           child: Row(
                             children: [
                              Image.asset(
                                ImageConstant.phone,
                                height: getVerticalSize(80),
                                width: getHorizontalSize(80),
                              ),
                              HorizontalSpace(width: 16),
                                Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      left: 0,
                                      top: 16,
                                      right: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                      
                                     
                                        
                                      
                                        Padding(
                                          padding: getPadding(
                                            left: 0,
                                          ),
                                          child: Text(
                                            "Via phone",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.bluegray50,
                                              fontSize: getFontSize(
                                                16,
                                              ),
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w600,
                                              height: 1.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: getHorizontalSize(
                                      263.00,
                                    ),
                                    margin: getMargin(
                                      left: 0,
                                      top: 10,
                                      right: 0,
                                      bottom: 18,
                                    ),
                                    child: Text(
                                      "+6282******39",
                                      maxLines: null,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: ColorConstant.bluegray400,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w400,
                                        height: 1.43,
                                      ),
                                    ),
                                  ),
                                ],
                                                     ),
                           
                            
                             ],
                           ),
                         )
                      
                       
                      ),
                    ),
                  ),
                
                
                 
                  CustomButton(
                    width: 380,
                    text: "Continue",
                    margin: getMargin(
                      left: 24,
                      top: 87,
                      right: 24,
                      bottom: 20,
                    ),
                    alignment: Alignment.center,
                    onTap: (){
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context)
 =>LightForgotPasswordFilledOtpScreen()),
  );
                    },
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
