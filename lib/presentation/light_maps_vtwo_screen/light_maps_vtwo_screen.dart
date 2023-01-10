import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/spacing.dart';

class LightMapsVtwoScreen extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    height: getVerticalSize(
                      882.00,
                    ),
                    width: size.width,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CommonImageView(
                            imagePath:isDark?ImageConstant.darkMap: ImageConstant.imgImage32,
                            height: getVerticalSize(
                              882.00,
                            ),
                            width: getHorizontalSize(
                              428.00,
                            ),
                          ),
                        ),
                      Column(
                        children: [
                          Container(
                                  width: size.width,
                                  margin: getMargin(
                                    left: 24,
                                    right: 24,
                                    top: 24
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          20.00,
                                        ),
                                      ),
                                    ),
                                    padding: getPadding(
                                      left: 20,
                                      right: 20
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          margin: getMargin(
                                            left: 0,
                                            top: 24,
                                            bottom: 26,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: getPadding(
                                                  left: 3,
                                                  top: 3,
                                                  right: 10,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: getPadding(
                                                        bottom: 1,
                                                      ),
                                                      child: CommonImageView(
                                                        imagePath: ImageConstant
                                                            .imgVector12X9,
                                                        height: getVerticalSize(
                                                          12.00,
                                                        ),
                                                        width:
                                                            getHorizontalSize(
                                                          9.00,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        left: 11,
                                                        top: 1,
                                                      ),
                                                      child: Text(
                                                        "Location (within 10 miles)",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          
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
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 9,
                                                  right: 10,
                                                ),
                                                child: Text(
                                                  "Los Angeles",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                   
                                                    fontSize: getFontSize(
                                                      18,
                                                    ),
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomButton(
                                          width: 100,
                                          text: "Change",
                                          margin: getMargin(
                                            left: 0,
                                            top: 29,
                                            bottom: 29,
                                          ),
                                          padding: ButtonPadding.PaddingAll10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        VerticalSpace(height: 120),
                        
                        Image.asset(ImageConstant.mapLocations)
                        
                        
                        ],
                      )
                     
                      ],
                    ),
                  ),
                ),
              ),
            ),
         
         
         
          ],
        ),
      ),
    );
  
  
  
  }
}
