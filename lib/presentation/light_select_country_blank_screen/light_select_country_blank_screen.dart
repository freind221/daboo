import 'package:kencan/presentation/light_fill_profile_blank_form_screen/light_fill_profile_blank_form_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LightSelectCountryBlankScreen extends StatefulWidget {
  @override
  State<LightSelectCountryBlankScreen> createState() =>
      _LightSelectCountryBlankScreenState();
}

class _LightSelectCountryBlankScreenState
    extends State<LightSelectCountryBlankScreen> {
  int radioGroup = -1;

  List<String> country = [
    'Saudi Arabia',
    'China',
    'UK',
    'Germany',
    'France',
    'Italy',
    'Dubai',
    'Qawait',
    'Polland'
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              height: getVerticalSize(
                882.00,
              ),
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: getMargin(
                        left: 24,
                        top: 28,
                        right: 24,
                        bottom: 28,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width,
                            margin: getMargin(
                              left: 4,
                              top: 9,
                              right: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 2,
                                    bottom: 0,
                                  ),
                                  child: CommonImageView(
                                    isBackBtn: true,
                                    isRtl: isRtl,
                                    imagePath: ImageConstant.imgArrowleft,
                                    height: getSize(
                                      15.00,
                                    ),
                                    width: getSize(
                                      15.00,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 24,
                                  ),
                                  child: Text(
                                    "Select Your Country",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: getFontSize(
                                        26,
                                      ),
                                      fontFamily: 'Source Sans Pro',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: getMargin(
                              top: 32,
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
                                  hintText: "Search",
                                  variant: TextFormFieldVariant.FillGray100,
                                  shape: TextFormFieldShape.RoundedBorder2,
                                  fontStyle: TextFormFieldFontStyle
                                      .SourceSansProRegular14,
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.centerLeft,
                                  suffix: Container(
                                    margin: getMargin(
                                      left: 30,
                                      top: 12,
                                      right: 29,
                                      bottom: 15,
                                    ),
                                    child: CommonImageView(
                                      svgPath: ImageConstant
                                          .imgVectorBluegray40017X17,
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                    minWidth: getHorizontalSize(
                                      17.00,
                                    ),
                                    minHeight: getVerticalSize(
                                      17.00,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: getPadding(top: 24, bottom: 100),
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: country.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        provider.setCountry(country[index]);
                                        radioGroup = index;
                                      });
                                    },
                                    child: Container(
                                      margin: getMargin(
                                        top: 6.0,
                                        bottom: 6.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? ColorConstant.darkTextField
                                            : ColorConstant.whiteA700,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            16.00,
                                          ),
                                        ),
                                        border: Border.all(
                                          color: radioGroup == index
                                              ? ColorConstant.redA200
                                              : isDark
                                                  ? ColorConstant.darkTextField
                                                  : ColorConstant.bluegray50,
                                          width: getHorizontalSize(
                                            1.00,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              left: 24,
                                              top: 24,
                                              bottom: 24,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    getHorizontalSize(
                                                      7.00,
                                                    ),
                                                  ),
                                                  // child: CommonImageView(
                                                  //   imagePath: ImageConstant
                                                  //       .imgImage30X30,
                                                  //   height: getSize(
                                                  //     30.00,
                                                  //   ),
                                                  //   width: getSize(
                                                  //     30.00,
                                                  //   ),
                                                  // ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    left: 24,
                                                    top: 7,
                                                    bottom: 8,
                                                  ),
                                                  child: Text(
                                                    "AF",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color: ColorConstant
                                                          .bluegray8007e,
                                                      fontSize: getFontSize(
                                                        14,
                                                      ),
                                                      fontFamily:
                                                          'Source Sans Pro',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    left: 24,
                                                    top: 9,
                                                    bottom: 3,
                                                  ),
                                                  child: Text(
                                                    country[index],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: getFontSize(
                                                        16,
                                                      ),
                                                      fontFamily:
                                                          'Source Sans Pro',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Theme(
                                            data: Theme.of(context).copyWith(
                                              unselectedWidgetColor:
                                                  ColorConstant.redA200,
                                              // disabledColor: Colors.blue
                                            ),
                                            child: Radio(
                                              value: index,
                                              activeColor:
                                                  ColorConstant.redA200,
                                              groupValue: radioGroup,
                                              onChanged: (value) {
                                                setState(() {
                                                  radioGroup = index;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: getMargin(
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? ColorConstant.darkTextField
                            : ColorConstant.whiteA700,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getHorizontalSize(
                              24.00,
                            ),
                          ),
                          topRight: Radius.circular(
                            getHorizontalSize(
                              24.00,
                            ),
                          ),
                        ),
                        border: Border.all(
                          color: isDark
                              ? ColorConstant.darkLine
                              : ColorConstant.bluegray50,
                          width: getHorizontalSize(
                            1.00,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomButton(
                            width: 380,
                            text: "Next",
                            margin: getMargin(
                              left: 24,
                              top: 24,
                              right: 24,
                              bottom: 20,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LightFillProfileBlankFormScreen()),
                              );
                            },
                            variant: ButtonVariant.FillRed200,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
