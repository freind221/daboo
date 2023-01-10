import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.height,
      this.width,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? height;

  double? width;

  Widget? child;

  VoidCallback? onTap;

  @override
 Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        constraints: BoxConstraints(
          minHeight: getSize(height ?? 0),
          minWidth: getSize(width ?? 0),
        ),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll13:
        return getPadding(
          all: 13,
        );
      case IconButtonPadding.PaddingAll4:
        return getPadding(
          all: 4,
        );
      case IconButtonPadding.PaddingAll18:
        return getPadding(
          all: 18,
        );
      case IconButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      case IconButtonPadding.PaddingAll23:
        return getPadding(
          all: 23,
        );
      default:
        return getPadding(
          all: 26,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillRedA200:
        return ColorConstant.redA200;
      case IconButtonVariant.OutlineRedA20033:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillRedA40019:
        return ColorConstant.redA40019;
      case IconButtonVariant.GradientRedA200RedA100:
      case IconButtonVariant.GradientRedA400e5Pink300e5:
      case IconButtonVariant.GradientAmber600Amber200:
      case IconButtonVariant.GradientBlueA400Blue300:
        return null;
      default:
        return ColorConstant.redA20019;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder12:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
      case IconButtonShape.CircleBorder28:
        return BorderRadius.circular(
          getHorizontalSize(
            28.00,
          ),
        );
      case IconButtonShape.CircleBorder34:
        return BorderRadius.circular(
          getHorizontalSize(
            34.44,
          ),
        );
      case IconButtonShape.CircleBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      case IconButtonShape.CircleBorder44:
        return BorderRadius.circular(
          getHorizontalSize(
            44.00,
          ),
        );
      case IconButtonShape.CircleBorder24:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            40.00,
          ),
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case IconButtonVariant.GradientRedA200RedA100:
        return LinearGradient(
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
        );
      case IconButtonVariant.GradientRedA400e5Pink300e5:
        return LinearGradient(
          begin: Alignment(
            1,
            1.0024292469024658,
          ),
          end: Alignment(
            0,
            0.0024292469024658203,
          ),
          colors: [
            ColorConstant.redA400E5,
            ColorConstant.pink300E5,
          ],
        );
      case IconButtonVariant.GradientAmber600Amber200:
        return LinearGradient(
          begin: Alignment(
            1,
            1.0024292469024658,
          ),
          end: Alignment(
            0,
            0.0024292469024658203,
          ),
          colors: [
            ColorConstant.amber600,
            ColorConstant.amber200,
          ],
        );
      case IconButtonVariant.GradientBlueA400Blue300:
        return LinearGradient(
          begin: Alignment(
            1,
            1.0024292469024658,
          ),
          end: Alignment(
            0,
            0.0024292469024658203,
          ),
          colors: [
            ColorConstant.blueA400,
            ColorConstant.blue300,
          ],
        );
      case IconButtonVariant.FillRedA20019:
      case IconButtonVariant.FillRedA200:
      case IconButtonVariant.OutlineRedA20033:
      case IconButtonVariant.FillRedA40019:
        return null;
      default:
        return null;
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineRedA20033:
        return [
          BoxShadow(
            color: ColorConstant.redA20033,
            spreadRadius: getHorizontalSize(
              0.00,
            ),
            blurRadius: getHorizontalSize(
              20.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case IconButtonVariant.FillRedA20019:
      case IconButtonVariant.FillRedA200:
      case IconButtonVariant.GradientRedA200RedA100:
      case IconButtonVariant.GradientRedA400e5Pink300e5:
      case IconButtonVariant.GradientAmber600Amber200:
      case IconButtonVariant.GradientBlueA400Blue300:
      case IconButtonVariant.FillRedA40019:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  RoundedBorder12,
  CircleBorder40,
  CircleBorder28,
  CircleBorder34,
  CircleBorder16,
  CircleBorder44,
  CircleBorder24,
}
enum IconButtonPadding {
  PaddingAll13,
  PaddingAll26,
  PaddingAll4,
  PaddingAll18,
  PaddingAll9,
  PaddingAll23,
}
enum IconButtonVariant {
  FillRedA20019,
  FillRedA200,
  GradientRedA200RedA100,
  GradientRedA400e5Pink300e5,
  GradientAmber600Amber200,
  GradientBlueA400Blue300,
  OutlineRedA20033,
  FillRedA40019,
}
