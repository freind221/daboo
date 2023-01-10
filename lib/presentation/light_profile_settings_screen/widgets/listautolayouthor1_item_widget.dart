import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Listautolayouthor1ItemWidget extends StatelessWidget {
  Listautolayouthor1ItemWidget();

  @override
 Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        top: 12.0,
        bottom: 12.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomIconButton(
                height: 56,
                width: 56,
                shape: IconButtonShape.CircleBorder28,
                padding: IconButtonPadding.PaddingAll18,
                child: CommonImageView(
                  imagePath: ImageConstant.imgVector16X16,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 16,
                  top: 20,
                  bottom: 19,
                ),
                child: Text(
                  "Edit Profile",
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
          Padding(
            padding: getPadding(
              left: 207,
              top: 16,
              bottom: 16,
            ),
            child: CommonImageView(
              imagePath: ImageConstant.imgAutolayouthor3,
              height: getSize(
                24.00,
              ),
              width: getSize(
                24.00,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
