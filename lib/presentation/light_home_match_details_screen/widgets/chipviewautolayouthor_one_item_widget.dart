import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';

// ignore: must_be_immutable
class ChipviewautolayouthorOneItemWidget extends StatelessWidget {
  List<dynamic> interestsList = [];
  int index;
  ChipviewautolayouthorOneItemWidget(
      {required this.interestsList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        right: 5,
        bottom: 5,
      ),
      child: Container(
        padding: getPadding(left: 16, right: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [
                ColorConstant.redA20075,
                ColorConstant.red,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Text(
          interestsList[index],
          textAlign: TextAlign.start,
          style: TextStyle(
            color: ColorConstant.whiteA700,
            fontSize: getFontSize(
              18,
            ),
            fontFamily: 'Source Sans Pro',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
