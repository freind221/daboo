import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';

// ignore: must_be_immutable
class ListinItemWidget extends StatelessWidget {
  ListinItemWidget();

  @override
 Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: getMargin(
          top: 6.0,
          bottom: 6.0,
        ),
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              16.00,
            ),
          ),
          border: Border.all(
            color: ColorConstant.bluegray50,
            width: getHorizontalSize(
              1.00,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                left: 24,
                top: 24,
                bottom: 24,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        7.00,
                      ),
                    ),
                    child: CommonImageView(
                      imagePath: ImageConstant.imgImage21,
                      height: getSize(
                        30.00,
                      ),
                      width: getSize(
                        30.00,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 7,
                      bottom: 8,
                    ),
                    child: Text(
                      "In",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstant.bluegray8007e,
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
                      left: 24,
                      top: 7,
                      bottom: 6,
                    ),
                    child: Text(
                      "India",
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
                ],
              ),
            ),
            Container(
              height: getSize(
                16.00,
              ),
              width: getSize(
                16.00,
              ),
              margin: getMargin(
                left: 193,
                top: 31,
                right: 24,
                bottom: 31,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    8.00,
                  ),
                ),
                border: Border.all(
                  color: ColorConstant.redA200,
                  width: getHorizontalSize(
                    1.00,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
