import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_icon_button.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

// ignore: must_be_immutable
class ListautolayouthorItemWidget extends StatelessWidget {
  ListautolayouthorItemWidget();

  @override
 Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: getMargin(
          top: 12.0,
          bottom: 12.0,
        ),
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              20.00,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.indigoA20014,
              spreadRadius: getHorizontalSize(
                2.00,
              ),
              blurRadius: getHorizontalSize(
                2.00,
              ),
              offset: Offset(
                12,
                26,
              ),
            ),
          ],
        ),
        child:
        
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomIconButton(
                height: 80,
                width: 80,
                margin: getMargin(
                  left: 24,
                  top: 24,
                  bottom: 24,
                ),
                child: CommonImageView(
                  imagePath: ImageConstant.imgAutolayouthor3,
                ),
              ),
              Container(
                margin: getMargin(
                  left: 20,
                  top: 39,
                  right: 144,
                  bottom: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        right: 10,
                      ),
                      child: Text(
                        "via SMS:",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorConstant.gray600,
                          fontSize: getFontSize(
                            14,
                          ),
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 16,
                      ),
                      child: Text(
                        "+6282******39",
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
            ],
          ),
        ),
      ),
    );
  }
}
