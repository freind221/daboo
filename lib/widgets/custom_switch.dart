import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kencan/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CustomSwitch extends StatefulWidget {
  CustomSwitch({this.alignment, this.padding, this.value, this.onChanged});

  Alignment? alignment;

  EdgeInsetsGeometry? padding;

  bool? value;

  Function(bool)? onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
 Widget build(BuildContext context) {

    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _buildSwitchWidget(),
          )
        : _buildSwitchWidget();
  }

  _buildSwitchWidget() {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: FlutterSwitch(
        value: widget.value ?? false,
        height: getHorizontalSize(32),
        width: getHorizontalSize(56),
        toggleSize: 24,
        borderRadius: getHorizontalSize(
          16.00,
        ),
        activeColor: ColorConstant.redA200,
        activeToggleColor: ColorConstant.whiteA700,
        inactiveColor: ColorConstant.gray500,
        inactiveToggleColor: ColorConstant.whiteA700,
        onToggle: (value) {
          widget.onChanged!(value);
        },
      ),
    );
  }
}
