import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/spacing.dart';

// ignore_for_file: must_be_immutable
class CustomCheckbox extends StatelessWidget {
  CustomCheckbox(
      {this.fontStyle,
      this.alignment,
      this.padding,
      this.iconSize,
      this.value,
      this.onChange,
      this.text});

  CheckboxFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? padding;

  double? iconSize;

  bool? value;

  Function(bool)? onChange;

  String? text;

  @override
 Widget build(BuildContext context) {

    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildCheckboxWidget(),
          )
        : _buildCheckboxWidget();
  }

  _buildCheckboxWidget() {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          value = !(value!);
          onChange!(value!);
        },
        child: Row(
          children: [
            SizedBox(
              height: getHorizontalSize(iconSize ?? 0),
              width: getHorizontalSize(iconSize ?? 0),
              child: Checkbox(
                activeColor: ColorConstant.redA200,
                side: BorderSide(color:ColorConstant.redA200,),
                 shape: RoundedRectangleBorder(
                                      
                                      side: BorderSide(
                                        color: ColorConstant.redA200,
                                        width: getHorizontalSize(
                                          3.00,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          5.00,
                                        ),
                                      ),
                                    ),
                value: value ?? false,
                onChanged: (value) {
                  onChange!(value!);
                },
              ),
            ),
            HorizontalSpace(width: 24),
            Padding(
              padding: getPadding(
                left: 0,
              ),
              child: Text(
                text ?? "",
                textAlign: TextAlign.center,
                style: _setFontStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
             
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum CheckboxFontStyle { SourceSansProSemiBold14 }
