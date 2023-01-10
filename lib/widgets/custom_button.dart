import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  String? text;

  @override
 Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Container(
      width: getHorizontalSize(width ?? 0),
      margin: margin,
      padding: _setPadding(),
      decoration: _buildDecoration(),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: _setFontStyle(),
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll10:
        return getPadding(
          all: 10,
        );
      default:
        return getPadding(
          all: 18,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillGray100:
        return ColorConstant.gray100;
      case ButtonVariant.FillRed200:
        return ColorConstant.red200;
      case ButtonVariant.FillRedA200:
        return ColorConstant.redA200;
      case ButtonVariant.Outline:
        return ColorConstant.whiteA700;
      case ButtonVariant.GradientRedA200RedA100:
      case ButtonVariant.OutlineRedA200:
      case ButtonVariant.Outline1_2:
        return null;
      default:
        return null;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineRedA200:
        return Border.all(
          color: ColorConstant.redA200,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.GradientRedA200RedA100:
      case ButtonVariant.FillGray100:
      case ButtonVariant.FillRed200:
      case ButtonVariant.FillRedA200:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder18:
        return BorderRadius.circular(
          getHorizontalSize(
            30.50,
          ),
        );
      case ButtonShape.RoundedBorder27:
        return BorderRadius.circular(
          getHorizontalSize(
            27.50,
          ),
        );
      case ButtonShape.RoundedBorder21:
        return BorderRadius.circular(
          getHorizontalSize(
            21.50,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            30.00,
          ),
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.Outline1_2:
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
      case ButtonVariant.FillGray100:
      case ButtonVariant.FillRed200:
      case ButtonVariant.OutlineRedA200:
      case ButtonVariant.FillRedA200:
      case ButtonVariant.Outline:
        return null;
      default:
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
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.SourceSansProRegular16:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SourceSansProSemiBold14:
        return TextStyle(
          color: ColorConstant.redA200,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SourceSansProSemiBold14WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SourceSansProSemiBold18RedA200:
        return TextStyle(
          color: ColorConstant.redA200,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SourceSansProRegular18:
        return TextStyle(
          color: ColorConstant.redA200,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SourceSansProRegular18WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder8,
  RoundedBorder18,
  RoundedBorder27,
  RoundedBorder21,
}
enum ButtonPadding {
  PaddingAll18,
  PaddingAll10,
}
enum ButtonVariant {
  GradientRedA200RedA100,
  FillGray100,
  FillRed200,
  OutlineRedA200,
  FillRedA200,
  Outline,
  Outline1_2,
}
enum ButtonFontStyle {
  SourceSansProSemiBold18,
  SourceSansProRegular16,
  SourceSansProSemiBold14,
  SourceSansProSemiBold14WhiteA700,
  SourceSansProSemiBold18RedA200,
  SourceSansProRegular18,
  SourceSansProRegular18WhiteA700,
}
