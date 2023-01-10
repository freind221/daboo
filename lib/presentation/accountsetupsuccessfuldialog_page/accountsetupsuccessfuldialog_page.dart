import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/presentation/home.dart';
import 'package:kencan/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class AccountsetupsuccessfuldialogPage extends StatelessWidget {
  @override
 Widget build(BuildContext context) {

   
    
    return Dialog(
      child: Container(
        width: double.infinity,
        margin: getMargin(
          left: 44,
          top: 0,
          right: 44,
          bottom: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: getPadding(
                left: 24,
                top: 40,
                right: 24,
              ),
              child:Image.asset(ImageConstant.congratsDialog)
           
            ),
           
           
            Container(
              width: getHorizontalSize(
                219.00,
              ),
              margin: getMargin(
                left: 24,
                top: 34,
                right: 24,
              ),
              child: Text(
                "Great!\nYour account has been created successfully",
                maxLines: null,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstant.redA200,
                  fontSize: getFontSize(
                    23,
                  ),
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomButton(
              width: 292,
              text: "Go to Home",
              margin: getMargin(
                left: 24,
                top: 28,
                right: 24,
                bottom: 20,
              ),
              onTap: (){
               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    Home()), (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
