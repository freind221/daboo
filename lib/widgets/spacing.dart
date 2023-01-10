import 'package:flutter/material.dart';
import '../core/app_export.dart';

// ignore_for_file: must_be_immutable
class HorizontalSpace extends StatelessWidget {
  double width;
  HorizontalSpace({required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(width),
    );
  }
}

class VerticalSpace extends StatelessWidget {
  double height;
  VerticalSpace({required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(height),
    );
  }
}

class CustomDivider extends StatelessWidget {
  CustomDivider(
      {Key? key,
      required this.isDark,
      this.bottomPadding = 20,
      this.topPadding = 20})
      : super(key: key);

  final bool isDark;
  double topPadding;
  double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: getMargin(top: topPadding, bottom: bottomPadding),
      color: isDark ? ColorConstant.darkLine : ColorConstant.bluegray50,
    );
  }
}
