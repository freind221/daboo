import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_button.dart';

class LightMatchCongratsVtwoScreen extends StatelessWidget {
  @override
 Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              height: getVerticalSize(
                882.00,
              ),
              width: size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: getMargin(
                        left: 9,
                        top: 31,
                        right: 10,
                        bottom: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width,
                            margin: getMargin(
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 15,
                                    bottom: 14,
                                  ),
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgClose34X34,
                                    height: getSize(
                                      34.00,
                                    ),
                                    width: getSize(
                                      34.00,
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CommonImageView(
                                      svgPath: ImageConstant.imgClose64X63,
                                      height: getVerticalSize(
                                        64.00,
                                      ),
                                      width: getHorizontalSize(
                                        63.00,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 66,
                                        top: 28,
                                        bottom: 12,
                                      ),
                                      child: CommonImageView(
                                        svgPath: ImageConstant.imgVector23X23,
                                        height: getSize(
                                          23.00,
                                        ),
                                        width: getSize(
                                          23.00,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 13,
                              right: 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 156,
                                    bottom: 197,
                                  ),
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgClose,
                                    height: getVerticalSize(
                                      29.00,
                                    ),
                                    width: getHorizontalSize(
                                      28.00,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: getVerticalSize(
                                    382.00,
                                  ),
                                  width: getHorizontalSize(
                                    358.00,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: getPadding(
                                            left: 49,
                                            top: 10,
                                            right: 49,
                                          ),
                                          child: CommonImageView(
                                            svgPath: ImageConstant.imgFavorite,
                                            height: getVerticalSize(
                                              31.00,
                                            ),
                                            width: getHorizontalSize(
                                              32.00,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          height: getVerticalSize(
                                            382.00,
                                          ),
                                          width: getHorizontalSize(
                                            358.00,
                                          ),
                                          margin: getMargin(
                                            bottom: 1,
                                          ),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  height: getVerticalSize(
                                                    301.00,
                                                  ),
                                                  width: getHorizontalSize(
                                                    341.00,
                                                  ),
                                                  margin: getMargin(
                                                    top: 34,
                                                    right: 10,
                                                    bottom: 34,
                                                  ),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                          height:
                                                              getVerticalSize(
                                                            283.00,
                                                          ),
                                                          width:
                                                              getHorizontalSize(
                                                            202.00,
                                                          ),
                                                          margin: getMargin(
                                                            right: 10,
                                                            bottom: 10,
                                                          ),
                                                          child: Stack(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            children: [
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    getHorizontalSize(
                                                                      32.00,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      CommonImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgImage31,
                                                                    height:
                                                                        getVerticalSize(
                                                                      283.00,
                                                                    ),
                                                                    width:
                                                                        getHorizontalSize(
                                                                      202.00,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment: Alignment
                                                                    .bottomLeft,
                                                                child: Padding(
                                                                  padding:
                                                                      getPadding(
                                                                    left: 4,
                                                                    top: 10,
                                                                    right: 10,
                                                                    bottom: 2,
                                                                  ),
                                                                  child:
                                                                      CommonImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgVolume,
                                                                    height:
                                                                        getVerticalSize(
                                                                      16.00,
                                                                    ),
                                                                    width:
                                                                        getHorizontalSize(
                                                                      17.00,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Padding(
                                                          padding: getPadding(
                                                            left: 10,
                                                            top: 10,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              getHorizontalSize(
                                                                32.00,
                                                              ),
                                                            ),
                                                            child:
                                                                CommonImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgImage8,
                                                              height:
                                                                  getVerticalSize(
                                                                283.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                202.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          height: getSize(
                                                            74.00,
                                                          ),
                                                          width: getSize(
                                                            74.00,
                                                          ),
                                                          margin: getMargin(
                                                            all: 40,
                                                          ),
                                                          child: Card(
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            elevation: 0,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    0),
                                                            color: ColorConstant
                                                                .whiteA700,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  37.00,
                                                                ),
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        getSize(
                                                                      53.00,
                                                                    ),
                                                                    width:
                                                                        getSize(
                                                                      53.00,
                                                                    ),
                                                                    margin:
                                                                        getMargin(
                                                                      all: 10,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        getHorizontalSize(
                                                                          26.50,
                                                                        ),
                                                                      ),
                                                                      gradient:
                                                                          LinearGradient(
                                                                        begin:
                                                                            Alignment(
                                                                          1,
                                                                          1.0024292469024658,
                                                                        ),
                                                                        end:
                                                                            Alignment(
                                                                          0,
                                                                          0.0024292469024658203,
                                                                        ),
                                                                        colors: [
                                                                          ColorConstant
                                                                              .redA20075,
                                                                          ColorConstant
                                                                              .redA10075,
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        getSize(
                                                                      53.00,
                                                                    ),
                                                                    width:
                                                                        getSize(
                                                                      53.00,
                                                                    ),
                                                                    margin:
                                                                        getMargin(
                                                                      all: 10,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        getHorizontalSize(
                                                                          26.50,
                                                                        ),
                                                                      ),
                                                                      gradient:
                                                                          LinearGradient(
                                                                        begin:
                                                                            Alignment(
                                                                          1,
                                                                          1.0024292469024658,
                                                                        ),
                                                                        end:
                                                                            Alignment(
                                                                          0,
                                                                          0.0024292469024658203,
                                                                        ),
                                                                        colors: [
                                                                          ColorConstant
                                                                              .redA200,
                                                                          ColorConstant
                                                                              .redA100,
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        getPadding(
                                                                      left: 20,
                                                                      top: 30,
                                                                      right: 20,
                                                                      bottom:
                                                                          29,
                                                                    ),
                                                                    child: Text(
                                                                      "100%",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        color: ColorConstant
                                                                            .gray900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                          14,
                                                                        ),
                                                                        fontFamily:
                                                                            'Source Sans Pro',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: getPadding(
                                                    left: 65,
                                                    right: 65,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 11,
                                                                right: 10,
                                                              ),
                                                              child:
                                                                  CommonImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgVector,
                                                                height:
                                                                    getVerticalSize(
                                                                  28.00,
                                                                ),
                                                                width:
                                                                    getHorizontalSize(
                                                                  30.00,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                top: 304,
                                                              ),
                                                              child:
                                                                  CommonImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgFavorite49X53,
                                                                height:
                                                                    getVerticalSize(
                                                                  49.00,
                                                                ),
                                                                width:
                                                                    getHorizontalSize(
                                                                  53.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          left: 121,
                                                          top: 28,
                                                          bottom: 330,
                                                        ),
                                                        child: CommonImageView(
                                                          svgPath: ImageConstant
                                                              .imgVector23X23,
                                                          height: getSize(
                                                            23.00,
                                                          ),
                                                          width: getSize(
                                                            23.00,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                  padding: getPadding(
                                                    left: 15,
                                                    top: 79,
                                                    right: 15,
                                                    bottom: 79,
                                                  ),
                                                  child: CommonImageView(
                                                    svgPath:
                                                        ImageConstant.imgClose,
                                                    height: getVerticalSize(
                                                      29.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      28.00,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: getPadding(
                                                    left: 10,
                                                    top: 164,
                                                    bottom: 164,
                                                  ),
                                                  child: CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgClose14X15,
                                                    height: getVerticalSize(
                                                      14.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      15.00,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: getPadding(
                                                    left: 10,
                                                    top: 11,
                                                    right: 2,
                                                    bottom: 11,
                                                  ),
                                                  child: CommonImageView(
                                                    svgPath:
                                                        ImageConstant.imgVolume,
                                                    height: getVerticalSize(
                                                      16.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: getMargin(
                              left: 15,
                              top: 13,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  getHorizontalSize(
                                    40.00,
                                  ),
                                ),
                                topRight: Radius.circular(
                                  getHorizontalSize(
                                    40.00,
                                  ),
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 23,
                                    top: 20,
                                    right: 23,
                                  ),
                                  child: Text(
                                    "It’s a Match",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorConstant.redA200,
                                      fontSize: getFontSize(
                                        60,
                                      ),
                                      fontFamily: 'Pacifico',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 23,
                                    top: 43,
                                    right: 23,
                                  ),
                                  child: Text(
                                    "Don't keep them waiting, say hello now!",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                       
                                      fontSize: getFontSize(
                                        20,
                                      ),
                                      fontFamily: 'Source Sans Pro',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                CustomButton(
                                  width: 380,
                                  text: "Say Hello",
                                  margin: getMargin(
                                    top: 26,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                CustomButton(
                                  width: 380,
                                  text: "Keep Swiping",
                                  margin: getMargin(
                                    top: 16,
                                  ),
                                  variant: ButtonVariant.OutlineRedA200,
                                  shape: ButtonShape.RoundedBorder27,
                                  fontStyle: ButtonFontStyle
                                      .SourceSansProSemiBold18RedA200,
                                  alignment: Alignment.centerLeft,
                                ),
                              ],
                            ),
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
