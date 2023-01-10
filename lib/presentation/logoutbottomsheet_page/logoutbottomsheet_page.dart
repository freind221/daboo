import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/domain/firebase_auth.dart';
import 'package:kencan/presentation/light_sign_in_filled_form_screen/light_sign_in_filled_form_screen.dart';
import 'package:kencan/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class LogoutbottomsheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
              38.00,
            ),
            margin: getMargin(
              left: 24,
              top: 8,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: ColorConstant.bluegray50,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  1.50,
                ),
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 24,
              top: 43,
              right: 24,
            ),
            child: CommonImageView(
              imagePath: ImageConstant.imgVector36X36,
              height: getSize(
                36.00,
              ),
              width: getSize(
                36.00,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 24,
              top: 36,
              right: 24,
            ),
            child: Text(
              "Are you sure want to logout?",
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
          Padding(
            padding: getPadding(
              left: 24,
              top: 37,
              right: 24,
              bottom: 48,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomButton(
                  width: 184,
                  text: "Cancel",
                  variant: ButtonVariant.OutlineRedA200,
                  shape: ButtonShape.RoundedBorder27,
                  fontStyle: ButtonFontStyle.SourceSansProSemiBold18RedA200,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                CustomButton(
                  width: 184,
                  text: "Yes, Logout",
                  onTap: () {
                    AuthMethod().logout().then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LightSignInFilledFormScreen()),
                      );
                    });
                  },
                  margin: getMargin(
                    left: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
