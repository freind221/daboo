import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/presentation/light_reset_password_successful_screen/light_reset_password_successful_screen.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/custom_checkbox.dart';
import 'package:kencan/widgets/custom_text_form_field.dart';

class LightResetPasswordFilledFormScreen extends StatefulWidget {
  @override
  State<LightResetPasswordFilledFormScreen> createState() => _LightResetPasswordFilledFormScreenState();
}

class _LightResetPasswordFilledFormScreenState extends State<LightResetPasswordFilledFormScreen> {
  bool checkbox = false;

  bool obscure1=true;

  bool obscure2=true;

  @override
 Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
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
                            "Reset Password",
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
                        top: 70,
                        right: 24,
                      ),
                      child: CommonImageView(
                        svgPath: ImageConstant.imgFrame,
                        height: getVerticalSize(
                          220.00,
                        ),
                        width: getHorizontalSize(
                          309.00,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 70,
                      right: 24,
                    ),
                    child: Text(
                      "Create a new password",
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      margin: getMargin(
                        left: 24,
                        top: 28,
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
                                      "New Password",
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
                                  isDark: isDark,
                            width: 380,
                            focusNode: FocusNode(),
                            hintText: "*************",
                            margin: getMargin(
                              top: 11,
                            ),
                            alignment: Alignment.centerLeft,
                            suffix: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        obscure1=!obscure1;
                                      });
                                    },
                                    child: Padding(
                                      padding:getPadding(
                                        left: 14,
                                        right: 14
                                      ),
                                      child: Container(
                                        height: getSize(
                                          24.17,
                                        ),
                                        width: getSize(
                                          24.67,
                                        ),
                                        child:obscure1? SvgPicture.asset(
                                          ImageConstant.visibilityOff,
                                          color: ColorConstant.bluegray400,
                                         
                                        
                                        ):SvgPicture.asset(ImageConstant.visibilityOn,
                                         
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
                            isObscureText: true,
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
                        top: 24,
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
                                      "Confirm New Password",
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
                                    onTap: (){
                                      setState(() {
                                        obscure2=!obscure2;
                                      });
                                    },
                                    child: Padding(
                                      padding:getPadding(
                                        left: 14,
                                        right: 14
                                      ),
                                      child: Container(
                                        height: getSize(
                                          24.17,
                                        ),
                                        width: getSize(
                                          24.67,
                                        ),
                                        child:obscure1? SvgPicture.asset(
                                          ImageConstant.visibilityOff,
                                          color: ColorConstant.bluegray400,
                                         
                                        
                                        ):SvgPicture.asset(ImageConstant.visibilityOn,
                                         
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
                            isObscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomCheckbox(
                    text: "Remember me",
                    value: checkbox,
                    padding: getPadding(
                      left: 48,
                      top: 26,
                      right: 48,
                    ),
                    onChange: (value) {
                      checkbox = value;
                      setState(() {
                        
                      });
                    },
                  ),
                  CustomButton(
                    width: 380,
                    text: "Save",
                    margin: getMargin(
                      left: 24,
                      top: 72,
                      right: 24,
                      bottom: 20,
                    ),
                    onTap: (){
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context)
 =>LightResetPasswordSuccessfulScreen()),
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
