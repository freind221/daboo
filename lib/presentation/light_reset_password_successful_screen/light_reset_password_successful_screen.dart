import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/presentation/home.dart';
import 'package:kencan/widgets/custom_button.dart';

class LightResetPasswordSuccessfulScreen extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 Padding(
                   padding: getPadding(
                    left: 20,
                    right: 20
                   ),
                   child: Image.asset(ImageConstant.inPagesLogo),
                 ),
                 
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 34,
                      right: 24,
                    ),
                    child: Text(
                      "Congratulations!",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstant.redA200,
                        fontSize: getFontSize(
                          32,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 34,
                      right: 24,
                    ),
                    child: Text(
                      "Your account is ready to use",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                           
                        fontSize: getFontSize(
                          18,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CustomButton(
                    width: 380,
                    text: "Go to Homepage",
                    onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          Home()), (Route<dynamic> route) => false);
                    },
                    margin: getMargin(
                      left: 24,
                      top: 134,
                      right: 24,
                      bottom: 20,
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
