import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';

// ignore_for_file: must_be_immutable
class QuickDialog extends StatefulWidget {
  bool nope;
  bool loved;
  bool superLoved;
  QuickDialog({

    this.nope=false,
    this.loved=false,
    this.superLoved=false,
  });

  @override
  State<QuickDialog> createState() => _QuickDialogState();
}

class _QuickDialogState extends State<QuickDialog> {
  @override
   void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds:300), (){
    Navigator.pop(context);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    if(widget.nope)
    return Center(
            child: Container(
              child: Image.asset(
                ImageConstant.nope,
                height: getVerticalSize(88),
                width: getHorizontalSize(88),
              ),
            ),
          );
    
else if(widget.loved)
 return Center(
            child: Container(
              child: Image.asset(
                ImageConstant.loved,
                height: getVerticalSize(88),
                width: getHorizontalSize(88),
              ),
            ),
          );
    
    
      return Center(
            child: Container(
              child: Image.asset(
                ImageConstant.superLoved,
                height: getVerticalSize(88),
                width: getHorizontalSize(88),
              ),
            ),
          );
    

  }
}