import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/models/person.dart';
import 'package:kencan/models/profile_model.dart';
import 'package:kencan/presentation/light_add_photos_screen/light_add_photos_screen.dart';
import 'package:kencan/presentation/light_home_photos_four_screen/quick_dialog.dart';
import 'package:kencan/presentation/light_select_interest_screen/light_select_interest_screen.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/providers/user_provider.dart';
import 'package:kencan/widgets/custom_icon_button.dart';
import 'package:kencan/widgets/spacing.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import '../homefilterbottomsheet_page/homefilterbottomsheet_page.dart';

class LightHomePhotosFourScreen extends StatefulWidget {
  //final List<Profile> model;
  // const LightHomePhotosFourScreen(
  //     { });
  @override
  State<LightHomePhotosFourScreen> createState() =>
      _LightHomePhotosFourScreenState();
}

class _LightHomePhotosFourScreenState extends State<LightHomePhotosFourScreen> {
  MatchEngine? _matchEngine;

  List<Person> personList = [
    Person(
        name: "Jenney",
        img: ImageConstant.person1,
        job: "Model",
        age: "21",
        msgs: 2,
        time: "20.0"),
    Person(
        name: "Annete",
        img: ImageConstant.person2,
        job: "Photographer",
        age: "22",
        msgs: 2,
        time: "16.0"),
    Person(
        name: "Sarah",
        img: ImageConstant.person3,
        job: "Model",
        age: "23",
        msgs: 1,
        time: "13.0"),
    Person(
        name: "Alice",
        img: ImageConstant.person4,
        job: "Designer",
        age: "22",
        msgs: 3,
        time: "11.0"),
    Person(
        name: "Kiera",
        img: ImageConstant.person5,
        job: "Singer",
        age: "21",
        msgs: 4,
        time: "10.0"),
    Person(
        name: "Hime",
        img: ImageConstant.person6,
        job: "Singer",
        age: "20",
        msgs: 2,
        time: "yesterday"),
  ];
  late List<Profile> modelsList = [];
  bool nope = false;
  bool loved = false;
  bool superLoved = false;
  List<SwipeItem> _swipeItems = <SwipeItem>[];

  bool isFinished = false;
  bool check = false;
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('profile');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    List<Profile> models = [];
    querySnapshot.docs.forEach((document) {
      models.add(Profile.fromSnap(document));
    });
    setState(() {
      modelsList = models;
    });

    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    // d = allData;
    // print(allData);
  }

  @override
  void initState() {
    //getData().then((value) => null);
    //final provider = Provider.of<ProfileProvider>(context);
    //print(provider.models.length);
    getData().then((value) {
      setState(() {
        check = true;
      });
      print(modelsList);
      for (int i = 0; i < modelsList.length; i++) {
        _swipeItems.add(SwipeItem(
            content: Content(
                name: modelsList[i].userName,
                img: ImageConstant.person6,
                job: modelsList[i].gender,
                age: modelsList[i].location),
            likeAction: () {
              setState(() {
                loved = true;
                superLoved = false;
                nope = false;
              });

              // print("liked ${personList[i].name}");
            },
            nopeAction: () {
              // print("Nope ${personList[i].name}");
              setState(() {
                nope = true;
                loved = false;
                superLoved = false;
              });
            },
            superlikeAction: () {
              setState(() {
                superLoved = true;
                nope = false;
                loved = false;
              });

              // print("superLiked ${personList[i].name}");
            },
            onSlideUpdate: (SlideRegion? region) async {
              print("Region $region");
            }));
      }

      _matchEngine = MatchEngine(swipeItems: _swipeItems);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: getMargin(
            top: 30,
            left: 24,
            right: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 4,
                        bottom: 4,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomIconButton(
                            height: 36,
                            width: 36,
                            variant: IconButtonVariant.GradientRedA200RedA100,
                            shape: IconButtonShape.CircleBorder16,
                            padding: IconButtonPadding.PaddingAll9,
                            child: CommonImageView(
                              svgPath: ImageConstant.imgClock,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 20,
                              top: 6,
                              bottom: 3,
                            ),
                            child: Text(
                              Constants.appName,
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
                    CustomIconButton(
                      height: 44,
                      width: 44,
                      onTap: () {
                        setState(() {
                          getData();
                          print(modelsList[0].interests);
                        });
                        // print(Provider.of<UserProvide>(context, listen: false)
                        //     .user
                        //     .uid);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             LightSelectInterestScreen()));
                        // FirebaseFirestore.instance
                        //     .collection('profile')
                        //     .doc(
                        //         Provider.of<UserProvide>(context, listen: false)
                        //             .user
                        //             .uid)
                        //     .get()
                        //     .then((value) {
                        //   print(value.get('name'));
                        // });
                        // showModalBottomSheet(
                        //     context: context,
                        //     isScrollControlled: true,
                        //     builder: (context) {
                        //       return HomefilterbottomsheetPage();
                        //     });
                      },
                      shape: IconButtonShape.RoundedBorder12,
                      padding: IconButtonPadding.PaddingAll13,
                      child: CommonImageView(
                        svgPath: ImageConstant.imgMenu44X44,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: getVerticalSize(675),
                child: isFinished
                    ? Center(
                        child: Padding(
                          padding: getPadding(left: 24, right: 24),
                          child: Text(
                            "you're all caught up for now!",
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorConstant.redA200,
                                fontWeight: FontWeight.w600,
                                fontSize: 25),
                          ),
                        ),
                      )
                    : Container(
                        height: getVerticalSize(675),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  height: getVerticalSize(620),
                                  // child: Image.network(modelsList[0].profilePic),
                                  //                                 child: SwipeableCardsSection(
                                  //                                   cardController: _cardController,
                                  //                                   context: context,
                                  //                                   //add the first 3 cards
                                  //                                   items: [
                                  //                                     Image.network(modelsList[0].profilePic),
                                  // // Image.network(modelsList[0].),
                                  //                                   ],
                                  //                                   onCardSwiped: (dir, index, widget) {
                                  //                                     //Add the next card

                                  //                                     // if (dir == Direction.left) {
                                  //                                     //   print('onDisliked ${(widget as CardView).text} $index');
                                  //                                     // } else if (dir == Direction.right) {
                                  //                                     //   print('onLiked ${(widget as CardView).text} $index');
                                  //                                     // } else if (dir == Direction.up) {
                                  //                                     //   print('onUp ${(widget as CardView).text} $index');
                                  //                                     // } else if (dir == Direction.down) {
                                  //                                     //   print('onDown ${(widget as CardView).text} $index');
                                  //                                     // }
                                  //                                   },
                                  //                                   enableSwipeUp: true,
                                  //                                   enableSwipeDown: true,
                                  //                                 ),
                                  child: check
                                      ? SwipeCards(
                                          matchEngine: _matchEngine!,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: getVerticalSize(
                                                620.00,
                                              ),
                                              width: getHorizontalSize(
                                                380.00,
                                              ),
                                              margin: getMargin(
                                                top: 26,
                                              ),
                                              child: Stack(
                                                alignment: Alignment.centerLeft,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: CommonImageView(
                                                      url: modelsList[index]
                                                          .profilePic,
                                                      height: getVerticalSize(
                                                        620.00,
                                                      ),
                                                      width: getHorizontalSize(
                                                        380.00,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          getHorizontalSize(
                                                            40.00,
                                                          ),
                                                        ),
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment(
                                                            0.5,
                                                            -3.0616171314629196e-17,
                                                          ),
                                                          end: Alignment(
                                                            0.5,
                                                            0.9999999999999999,
                                                          ),
                                                          colors: [
                                                            ColorConstant
                                                                .redA20000,
                                                            ColorConstant
                                                                .redA2008a,
                                                            ColorConstant
                                                                .redA200,
                                                          ],
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Padding(
                                                          padding: getPadding(
                                                            left: 10,
                                                            top: 90,
                                                            right: 10,
                                                            bottom: 60,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    getMargin(
                                                                  top: 10,
                                                                  bottom: 2,
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "${modelsList[index].userName}, 21",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style:
                                                                          TextStyle(
                                                                        color: ColorConstant
                                                                            .whiteA700,
                                                                        fontSize:
                                                                            getFontSize(
                                                                          32,
                                                                        ),
                                                                        fontFamily:
                                                                            'Source Sans Pro',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          getPadding(
                                                                        top: 12,
                                                                        right:
                                                                            10,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        modelsList[index]
                                                                            .country,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              ColorConstant.whiteA700,
                                                                          fontSize:
                                                                              getFontSize(
                                                                            20,
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
                                                              Image.asset(
                                                                ImageConstant
                                                                    .whiteThreeDots,
                                                                height:
                                                                    getVerticalSize(
                                                                        30),
                                                                width:
                                                                    getHorizontalSize(
                                                                        30),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          onStackFinished: () {
                                            // _scaffoldKey.currentState!.showSnackBar(SnackBar(
                                            //   content: Text("Stack Finished"),
                                            //   duration: Duration(milliseconds: 500),
                                            // ));

                                            isFinished = true;
                                          },
                                          itemChanged:
                                              (SwipeItem item, int index) {
                                            if (index < (modelsList.length)) {
                                              print(
                                                  "item: ${item.content.name}, index: $index");
                                              if (nope) {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return QuickDialog(
                                                        nope: true,
                                                      );
                                                    });
                                              } else if (loved) {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return QuickDialog(
                                                        loved: true,
                                                      );
                                                    });
                                              } else {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return QuickDialog(
                                                        superLoved: true,
                                                      );
                                                    });
                                              }
                                            } else {
                                              isFinished = true;
                                            }
                                          },
                                          upSwipeAllowed: true,
                                          fillSpace: true,
                                        )
                                      : Center(
                                          child: Text("Loading.........."))),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: getPadding(
                                  left: 0,
                                  top: 10,
                                  right: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CustomIconButton(
                                      height: 76,
                                      width: 76,
                                      margin: getMargin(
                                        top: 6,
                                        bottom: 6,
                                      ),
                                      onTap: () {
                                        _matchEngine!.currentItem!.nope();
                                      },
                                      variant:
                                          IconButtonVariant.OutlineRedA20033,
                                      child: CommonImageView(
                                        imagePath:
                                            ImageConstant.imgAutolayouthor76X76,
                                      ),
                                    ),
                                    HorizontalSpace(width: 10),
                                    CustomIconButton(
                                      height: 88,
                                      width: 88,
                                      margin: getMargin(
                                        left: 0,
                                      ),
                                      onTap: () {
                                        _matchEngine!.currentItem!.like();
                                      },
                                      variant:
                                          IconButtonVariant.OutlineRedA20033,
                                      shape: IconButtonShape.CircleBorder44,
                                      padding: IconButtonPadding.PaddingAll23,
                                      child: CommonImageView(
                                        imagePath:
                                            ImageConstant.imgAutolayouthor88X88,
                                      ),
                                    ),
                                    HorizontalSpace(width: 10),
                                    CustomIconButton(
                                      height: 76,
                                      width: 76,
                                      margin: getMargin(
                                        left: 0,
                                        top: 6,
                                        bottom: 6,
                                      ),
                                      onTap: () {
                                        _matchEngine!.currentItem!.superLike();
                                      },
                                      variant:
                                          IconButtonVariant.OutlineRedA20033,
                                      child: CommonImageView(
                                        imagePath:
                                            ImageConstant.imgAutolayouthor4,
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

              //      SwipeableCardsSection(
              //   cardController: _cardController,
              //   context: context,
              //   //add the first 3 cards
              //   items: [
              //    Container(
              //     height: getVerticalSize(
              //       620.00,
              //     ),
              //     width: getHorizontalSize(
              //       380.00,
              //     ),
              //     margin: getMargin(
              //       top: 26,
              //     ),
              //     child: Stack(
              //       alignment: Alignment.centerLeft,
              //       children: [
              //         Align(
              //           alignment: Alignment.centerLeft,
              //           child: ClipRRect(
              //             borderRadius:
              //                 BorderRadius.circular(
              //               getHorizontalSize(
              //                 40.00,
              //               ),
              //             ),
              //             child: CommonImageView(
              //               imagePath: ImageConstant
              //                   .imgImage620X380,
              //               height: getVerticalSize(
              //                 620.00,
              //               ),
              //               width: getHorizontalSize(
              //                 380.00,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Align(
              //           alignment: Alignment.bottomCenter,
              //           child: Container(
              //             decoration: BoxDecoration(
              //               borderRadius:
              //                   BorderRadius.circular(
              //                 getHorizontalSize(
              //                   40.00,
              //                 ),
              //               ),
              //               gradient: LinearGradient(
              //                 begin: Alignment(
              //                   0.5,
              //                   -3.0616171314629196e-17,
              //                 ),
              //                 end: Alignment(
              //                   0.5,
              //                   0.9999999999999999,
              //                 ),
              //                 colors: [
              //                   ColorConstant.redA20000,
              //                   ColorConstant.redA2008a,
              //                   ColorConstant.redA200,
              //                 ],
              //               ),
              //             ),

              //           ),
              //         ),
              //       ],
              //     ),
              //     ),

              //        Container(
              //     height: getVerticalSize(
              //       620.00,
              //     ),
              //     width: getHorizontalSize(
              //       380.00,
              //     ),
              //     margin: getMargin(
              //       top: 26,
              //     ),
              //     child: Stack(
              //       alignment: Alignment.centerLeft,
              //       children: [
              //         Align(
              //           alignment: Alignment.centerLeft,
              //           child: ClipRRect(
              //             borderRadius:
              //                 BorderRadius.circular(
              //               getHorizontalSize(
              //                 40.00,
              //               ),
              //             ),
              //             child: CommonImageView(
              //               imagePath: ImageConstant
              //                   .imgImage620X380,
              //               height: getVerticalSize(
              //                 620.00,
              //               ),
              //               width: getHorizontalSize(
              //                 380.00,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Align(
              //           alignment: Alignment.bottomCenter,
              //           child: Container(
              //             decoration: BoxDecoration(
              //               borderRadius:
              //                   BorderRadius.circular(
              //                 getHorizontalSize(
              //                   40.00,
              //                 ),
              //               ),
              //               gradient: LinearGradient(
              //                 begin: Alignment(
              //                   0.5,
              //                   -3.0616171314629196e-17,
              //                 ),
              //                 end: Alignment(
              //                   0.5,
              //                   0.9999999999999999,
              //                 ),
              //                 colors: [
              //                   ColorConstant.redA20000,
              //                   ColorConstant.redA2008a,
              //                   ColorConstant.redA200,
              //                 ],
              //               ),
              //             ),

              //           ),
              //         ),
              //       ],
              //     ),
              //     ),

              //        Container(
              //     height: getVerticalSize(
              //       620.00,
              //     ),
              //     width: getHorizontalSize(
              //       380.00,
              //     ),
              //     margin: getMargin(
              //       top: 26,
              //     ),
              //     child: Stack(
              //       alignment: Alignment.centerLeft,
              //       children: [
              //         Align(
              //           alignment: Alignment.centerLeft,
              //           child: ClipRRect(
              //             borderRadius:
              //                 BorderRadius.circular(
              //               getHorizontalSize(
              //                 40.00,
              //               ),
              //             ),
              //             child: CommonImageView(
              //               imagePath: ImageConstant
              //                   .imgImage620X380,
              //               height: getVerticalSize(
              //                 620.00,
              //               ),
              //               width: getHorizontalSize(
              //                 380.00,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Align(
              //           alignment: Alignment.bottomCenter,
              //           child: Container(
              //             decoration: BoxDecoration(
              //               borderRadius:
              //                   BorderRadius.circular(
              //                 getHorizontalSize(
              //                   40.00,
              //                 ),
              //               ),
              //               gradient: LinearGradient(
              //                 begin: Alignment(
              //                   0.5,
              //                   -3.0616171314629196e-17,
              //                 ),
              //                 end: Alignment(
              //                   0.5,
              //                   0.9999999999999999,
              //                 ),
              //                 colors: [
              //                   ColorConstant.redA20000,
              //                   ColorConstant.redA2008a,
              //                   ColorConstant.redA200,
              //                 ],
              //               ),
              //             ),

              //           ),
              //         ),
              //       ],
              //     ),
              //     ),

              //   ],
              //   onCardSwiped: (dir, index, widget) {
              //     //Add the next card

              //     if (counter <= 20) {
              //       _cardController.addItem(
              //         Container(
              //     height: getVerticalSize(
              //       620.00,
              //     ),
              //     width: getHorizontalSize(
              //       380.00,
              //     ),
              //     margin: getMargin(
              //       top: 26,
              //     ),
              //     child: Stack(
              //       alignment: Alignment.centerLeft,
              //       children: [
              //         Align(
              //           alignment: Alignment.centerLeft,
              //           child: ClipRRect(
              //             borderRadius:
              //                 BorderRadius.circular(
              //               getHorizontalSize(
              //                 40.00,
              //               ),
              //             ),
              //             child: CommonImageView(
              //               imagePath: ImageConstant
              //                   .imgImage620X380,
              //               height: getVerticalSize(
              //                 620.00,
              //               ),
              //               width: getHorizontalSize(
              //                 380.00,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Align(
              //           alignment: Alignment.bottomCenter,
              //           child: Container(
              //             decoration: BoxDecoration(
              //               borderRadius:
              //                   BorderRadius.circular(
              //                 getHorizontalSize(
              //                   40.00,
              //                 ),
              //               ),
              //               gradient: LinearGradient(
              //                 begin: Alignment(
              //                   0.5,
              //                   -3.0616171314629196e-17,
              //                 ),
              //                 end: Alignment(
              //                   0.5,
              //                   0.9999999999999999,
              //                 ),
              //                 colors: [
              //                   ColorConstant.redA20000,
              //                   ColorConstant.redA2008a,
              //                   ColorConstant.redA200,
              //                 ],
              //               ),
              //             ),

              //           ),
              //         ),
              //       ],
              //     ),
              //     ),

              //        );
              //       counter++;
              //     }

              //     if (dir == Direction.left) {

              //     } else if (dir == Direction.right) {

              //     } else if (dir == Direction.up) {

              //     } else if (dir == Direction.down) {

              //     }
              //   },
              //   enableSwipeUp: true,
              //   enableSwipeDown: true,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class Content {
  final String name;
  final String img;
  final String job;
  final String age;

  Content({
    required this.name,
    required this.img,
    required this.job,
    required this.age,
  });
}
