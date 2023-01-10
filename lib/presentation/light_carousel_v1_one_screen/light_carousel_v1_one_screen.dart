import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/presentation/light_sign_in_method_screen/light_sign_in_method_screen.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/spacing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LightCarouselV1OneScreen extends StatefulWidget {
  @override
  State<LightCarouselV1OneScreen> createState() =>
      _LightCarouselV1OneScreenState();
}

class _LightCarouselV1OneScreenState extends State<LightCarouselV1OneScreen> {
  List<String> imageList = [
    ImageConstant.onBparding1,
    ImageConstant.onBoarding2,
    ImageConstant.onBoarding3,
  ];

  int sliderIndex = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SafeArea(
          child: Container(
            width: size.width,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalSpace(height: 30),
                    CarouselSlider.builder(
                        carouselController: buttonCarouselController,
                        itemCount: imageList.length,
                        itemBuilder: (context, index, realIndex) {
                          return Padding(
                            padding: getPadding(
                              left: 0,
                            ),
                            child: CommonImageView(
                              imagePath: imageList[index],
                              height: getVerticalSize(
                                380.00,
                              ),
                              width: getHorizontalSize(
                                280.00,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 380,
                          viewportFraction: 0.7,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (index, _) {
                            setState(() {
                              sliderIndex = index;
                            });
                          },
                          scrollDirection: Axis.horizontal,
                        )),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: double.infinity,
                        margin: getMargin(
                          top: 44,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
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
                          border: Border.all(
                            color: ColorConstant.bluegray50,
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
                            Container(
                              height: getVerticalSize(
                                3.00,
                              ),
                              width: getHorizontalSize(
                                38.00,
                              ),
                              margin: getMargin(
                                left: 24,
                                top: 8,
                                right: 24,
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
                            Container(
                              width: getHorizontalSize(
                                315.00,
                              ),
                              margin: getMargin(
                                left: 24,
                                top: 49,
                                right: 24,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Find people who ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getFontSize(
                                          32,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'match',
                                      style: TextStyle(
                                        color: ColorConstant.redA200,
                                        fontSize: getFontSize(
                                          32,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' with you',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getFontSize(
                                          32,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              height: getVerticalSize(
                                6.00,
                              ),
                              margin: getMargin(
                                left: 24,
                                top: 43,
                                right: 24,
                              ),
                              child: AnimatedSmoothIndicator(
                                activeIndex: sliderIndex,
                                count: 3,
                                axisDirection: Axis.horizontal,
                                effect: ScrollingDotsEffect(
                                  spacing: 12,
                                  activeDotColor: ColorConstant.redA200,
                                  dotColor: ColorConstant.bluegray50,
                                  dotHeight: getVerticalSize(
                                    6.00,
                                  ),
                                  dotWidth: getHorizontalSize(
                                    6.00,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: getMargin(
                                left: 24,
                                top: 37,
                                right: 24,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    4.00,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getHorizontalSize(
                                      34.00,
                                    ),
                                    margin: getMargin(
                                      left: 0,
                                      top: 20,
                                      right: 0,
                                      bottom: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          9.00,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LightSignInMethodScreen()),
                                              );
                                            },
                                            child: Text(
                                              "Skip",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.redA200,
                                                fontSize: getFontSize(
                                                  18,
                                                ),
                                                fontFamily: 'Source Sans Pro',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomButton(
                              width: 380,
                              text: "Next",
                              margin: getMargin(
                                left: 24,
                                top: 12,
                                right: 24,
                                bottom: 20,
                              ),
                              onTap: () {
                                if(sliderIndex<2)
                                {buttonCarouselController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear);}
                                    else{
                                        Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LightSignInMethodScreen()),
                                              );
                                    }
                              },
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
      ),
    );
  }
}
