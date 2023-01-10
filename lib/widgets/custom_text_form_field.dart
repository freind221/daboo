import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';


// ignore_for_file: must_be_immutable
class CustomTextFormField extends StatelessWidget {
   CustomTextFormField(
        
      {this.shape,
      this.maxLines=1,

      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.hintText,
      this.isDark=false,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;
  bool isDark;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  String? hintText;
  int maxLines;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
 Widget build(BuildContext context) {
   
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: getHorizontalSize(width ?? 0),
      margin: margin,
      child: TextFormField(
        maxLines:maxLines ,

        controller: controller,
        focusNode: focusNode,
        style:  TextStyle(
        
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        ),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.redA100,
            width: 1,
          ),
        ),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.SourceSansProRegular16:
        return TextStyle(
          color: ColorConstant.bluegray300,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.SourceSansProSemiBold16Gray300:
        return TextStyle(
          color: ColorConstant.gray300,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.SourceSansProRegular14:
        return TextStyle(
         
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.SourceSansProRegular16Bluegray700:
        return TextStyle(
          color: ColorConstant.bluegray700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray300,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case TextFormFieldShape.RoundedBorder2:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBluegray50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color:isDark?ColorConstant.darkLine: ColorConstant.bluegray50,
            width: 1,
          ),
        );
      case TextFormFieldVariant.FillGray100:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillWhiteA70099:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: isDark?ColorConstant.darkLine: ColorConstant.bluegray50,
            width: 2,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case  TextFormFieldVariant.OutlineBluegray50:
        return isDark?ColorConstant.darkTextField: ColorConstant.whiteA700;
      case TextFormFieldVariant.FillGray100:
        return isDark?ColorConstant.darkTextField: ColorConstant.gray100;
      case TextFormFieldVariant.FillWhiteA70099:
        return ColorConstant.whiteA70099;
      default:
        return isDark?ColorConstant.darkTextField: ColorConstant.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBluegray50:
        return true;
      case TextFormFieldVariant.FillGray100:
        return true;
      case TextFormFieldVariant.FillWhiteA70099:
        return true;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT18:
        return getPadding(
          left: 12,
          top: 18,
          right: 12,
          bottom: 12,
        );
      case TextFormFieldPadding.PaddingT27:
        return getPadding(
          left: 20,
          top: 27,
          right: 20,
          bottom: 20,
        );
      case TextFormFieldPadding.PaddingT12:
        return getPadding(
          left: 11,
          top: 12,
          right: 11,
          bottom: 11,
        );
      default:
        return getPadding(
          left: 15,
          top: 16,
          right: 15,
          bottom: 15,
        );
    }
  }
}

enum TextFormFieldShape {
  CircleBorder24,
  RoundedBorder20,
  RoundedBorder2,
}
enum TextFormFieldPadding {
  PaddingT16,
  PaddingT18,
  PaddingT27,
  PaddingT12,
}
enum TextFormFieldVariant {
  OutlineRedA200,
  OutlineBluegray50,
  FillGray100,
  FillWhiteA70099,
}
enum TextFormFieldFontStyle {
  SourceSansProSemiBold16,
  SourceSansProRegular16,
  SourceSansProSemiBold16Gray300,
  SourceSansProRegular14,
  SourceSansProRegular16Bluegray700,
}
