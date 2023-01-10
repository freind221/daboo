import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/custom_text_form_field.dart';
import 'package:kencan/widgets/spacing.dart';

// ignore_for_file: must_be_immutable
class HomefilterbottomsheetPage extends StatefulWidget {
  @override
  State<HomefilterbottomsheetPage> createState() => _HomefilterbottomsheetPageState();
}

class _HomefilterbottomsheetPageState extends State<HomefilterbottomsheetPage> {
  
  RangeValues sliderRange = RangeValues(22, 40);
  List<String>genderList=[
    "Male",
    "Female",
  ];
  int selectedGenderIndex=0;
  @override
 Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: getVerticalSize(
                3.00,
              ),
              width: getHorizontalSize(
                38.00,
              ),
              margin: getMargin(
                left: 23,
                top: 8,
                right: 23,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.bluegray50,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    1.50,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 23,
                top: 29,
                right: 23,
              ),
              child: Text(
                "Filter",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                   
                  fontSize: getFontSize(
                    20,
                  ),
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 24,
              top: 33,
              right: 24,
            ),
            child: Text(
              "Location",
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
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              margin: getMargin(
                left: 23,
                top: 12,
                right: 23,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    2.00,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   CustomTextFormField(
                                  isDark: isDark,
                    width: 380,
                    focusNode: FocusNode(),
                    hintText: "Los Angeles",
                    shape: TextFormFieldShape.RoundedBorder2,
                    padding: TextFormFieldPadding.PaddingT18,
                    textInputAction: TextInputAction.done,
                    alignment: Alignment.centerLeft,
                    suffix: Container(
                      margin: getMargin(
                        left: 30,
                        top: 14,
                        right: 29,
                        bottom: 14,
                      ),
                      child: CommonImageView(
                        svgPath: ImageConstant.imgLocation,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      minWidth: getHorizontalSize(
                        14.00,
                      ),
                      minHeight: getVerticalSize(
                        19.00,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 24,
              top: 28,
              right: 24,
            ),
            child: Text(
              "Gender",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: getVerticalSize(65),
                child: ListView.builder (
                  padding: getPadding(
                    top: 20,
                    left: 15,
                    right: 15
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: genderList.length,
                  shrinkWrap: true,

                  itemBuilder:(context, index) {
                  return InkWell(
                    onTap: (){
                      setState(() {
                        selectedGenderIndex=index;
                      });
                    },
                    child: Container(
                      margin: getMargin(
                        left: 5,
                        right: 5
                      ),
                    padding: getPadding(
                      left: 20,
                      right: 20,
                  
                      top: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color:selectedGenderIndex==index?ColorConstant.redA200: Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          21.50,
                        ),
                      ),
                      border: Border.all(
                        color: ColorConstant.redA200,
                        width: getHorizontalSize(
                          2.00,
                        ),
                      ),
                    ),
                    child: Text(
                      genderList[index],
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color:selectedGenderIndex==index?Colors.white: ColorConstant.redA200,
                        fontSize: getFontSize(
                          18,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                                  ),
                  );
              
                }, ),
              )
           
            ],
          ),
          Padding(
            padding: getPadding(
              left: 23,
              top: 31,
              right: 23,
            ),
            child: Text(
              "Age",
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
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(
                left: 23,
                top: 9,
                right: 23,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                
                 
                Container(
                      height: getVerticalSize(
                        16.00,
                      ),
                      width: getHorizontalSize(
                        335.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          20.00,
                        ),
                        top: getVerticalSize(
                          16.00,
                        ),
                        right: getHorizontalSize(
                          20.00,
                        ),
                      ),
                      child: SliderTheme(
                        data: SliderThemeData(
                          trackShape: RoundedRectSliderTrackShape(),
                          valueIndicatorColor: ColorConstant.redA200B2,
                          activeTrackColor: ColorConstant.redA200B2,
                          inactiveTrackColor:isDark?ColorConstant.darkTextField: ColorConstant.gray300,
                          thumbColor:isDark?ColorConstant.darkBg: ColorConstant.whiteA700,
                          thumbShape: RoundSliderThumbShape(),
                        ),
                        child: RangeSlider(
                          labels: RangeLabels(
                            sliderRange.start.round().toString(),
                            sliderRange.end.round().toString(),
                          ),
                          values: sliderRange,
                          divisions: 100,
                          min: 0,
                          max: 100,
                          onChanged: (value) {
                            setState(() {
                              sliderRange = value;
                            });
                          },
                        ),
                      ),
                    ),
               
                ],
              ),
            ),
          ),
         CustomDivider(isDark: isDark),
          
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 23,
                top: 23,
                right: 23,
                bottom: 48,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomButton(
                    width: 124,
                    text: "Reset",
                    variant: ButtonVariant.OutlineRedA200,
                    shape: ButtonShape.RoundedBorder27,
                    fontStyle: ButtonFontStyle.SourceSansProSemiBold18RedA200,
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  CustomButton(
                    width: 244,
                    text: "Apply Filter",
                    margin: getMargin(
                      left: 12,
                    ),
                     onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
