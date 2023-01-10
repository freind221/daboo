import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class GridautolayouthorItemWidget extends StatelessWidget {
  GridautolayouthorItemWidget();

  @override
 Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color:isDark?ColorConstant.darkLine:ColorConstant.bluegray50
          ),
          color:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
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
                imagePath: ImageConstant.imgAutolayouthor,
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
    );
  
  
  
  }
}
