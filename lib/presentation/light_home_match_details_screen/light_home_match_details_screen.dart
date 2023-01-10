import 'package:carousel_slider/carousel_slider.dart';
import 'package:kencan/presentation/light_inbox_screen/light_inbox_screen.dart';
import 'package:kencan/widgets/spacing.dart';
import '../light_home_match_details_screen/widgets/chipviewautolayouthor_one_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_icon_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LightHomeMatchDetailsScreen extends StatefulWidget {
  final String name;
  final String age;
  final String job;
  final String bio;
  final String url;
  List<dynamic> interests;
  LightHomeMatchDetailsScreen(
      {required this.age,
      required this.bio,
      required this.interests,
      required this.name,
      required this.url,
      required this.job});
  @override
  State<LightHomeMatchDetailsScreen> createState() =>
      _LightHomeMatchDetailsScreenState();
}

class _LightHomeMatchDetailsScreenState
    extends State<LightHomeMatchDetailsScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
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
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: getVerticalSize(
                        596.00,
                      ),
                      width: size.width,
                      margin: getMargin(
                        bottom: 10,
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: getVerticalSize(
                                    596.00,
                                  ),
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: false,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, _) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                                itemCount: 5,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    height: getVerticalSize(
                                      596.00,
                                    ),
                                    width: size.width,
                                    child: Stack(
                                      children: [
                                        CommonImageView(
                                          url: widget.url,
                                          height: getVerticalSize(
                                            596.00,
                                          ),
                                          width: size.width,
                                        ),
                                        Container(
                                            height: getVerticalSize(
                                              596.00,
                                            ),
                                            width: size.width,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment(
                                                  0.5,
                                                  -3.0616171314629196e-17,
                                                ),
                                                end: Alignment(
                                                  0.5,
                                                  0.9999999999999999,
                                                ),
                                                colors: [
                                                  ColorConstant.redA20000,
                                                  ColorConstant.redA2008a,
                                                  ColorConstant.redA200,
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  );
                                },
                              )),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        left: 28,
                                        top: 40,
                                        right: 28,
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
                                  ],
                                ),
                                VerticalSpace(height: 6),
                                Container(
                                  height: getVerticalSize(
                                    6.00,
                                  ),
                                  margin: getMargin(
                                    left: 28,
                                    top: 0,
                                    right: 28,
                                    bottom: 0,
                                  ),
                                  child: AnimatedSmoothIndicator(
                                    activeIndex: activeIndex,
                                    count: 5,
                                    axisDirection: Axis.horizontal,
                                    effect: ScrollingDotsEffect(
                                      spacing: 12,
                                      activeDotColor: ColorConstant.redA200,
                                      dotColor: ColorConstant.whiteA700,
                                      dotHeight: getVerticalSize(
                                        6.00,
                                      ),
                                      dotWidth: getHorizontalSize(
                                        6.00,
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 6),
                              ],
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
                            ? ColorConstant.darkBg
                            : ColorConstant.whiteA700,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding(
                                left: 31,
                                top: 24,
                                right: 31,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    margin: getMargin(
                                      top: 10,
                                      bottom: 2,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${widget.name}, ${widget.age}",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: getFontSize(
                                              32,
                                            ),
                                            fontFamily: 'Source Sans Pro',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 12,
                                            right: 10,
                                          ),
                                          child: Text(
                                            widget.job,
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
                                      ],
                                    ),
                                  ),
                                  CustomIconButton(
                                    height: 56,
                                    width: 56,
                                    margin: getMargin(
                                      top: 11,
                                      bottom: 11,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LightInboxScreen()),
                                      );
                                    },
                                    variant: IconButtonVariant
                                        .GradientRedA200RedA100,
                                    shape: IconButtonShape.CircleBorder28,
                                    padding: IconButtonPadding.PaddingAll18,
                                    child: CommonImageView(
                                      svgPath: ImageConstant.imgMenu,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 31,
                              top: 29,
                              right: 31,
                            ),
                            child: Text(
                              "About",
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
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: getHorizontalSize(
                                353.00,
                              ),
                              margin: getMargin(
                                left: 31,
                                top: 19,
                                right: 31,
                              ),
                              child: Text(
                                widget.bio,
                                maxLines: null,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 32,
                              top: 29,
                              right: 32,
                            ),
                            child: Text(
                              "Interest",
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
                          Align(
                            alignment: Alignment.center,
                            child: Wrap(
                              children: List<Widget>.generate(
                                  widget.interests.length,
                                  (index) => ChipviewautolayouthorOneItemWidget(
                                        index: index,
                                        interestsList: widget.interests != []
                                            ? widget.interests
                                            : interestsList,
                                      )),
                            ),
                          ),
                          VerticalSpace(height: 20)
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

  List<String> interestsList = [
    "👗 Fashion",
  ];
}
