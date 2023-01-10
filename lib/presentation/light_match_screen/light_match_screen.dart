import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kencan/models/profile_model.dart';
import 'package:kencan/presentation/homefilterbottomsheet_page/homefilterbottomsheet_page.dart';
import 'package:kencan/presentation/light_home_match_details_screen/light_home_match_details_screen.dart';
import 'package:kencan/presentation/light_see_all_match_screen/light_see_all_match_screen.dart';
import 'package:kencan/widgets/spacing.dart';
import '../../models/person.dart';
import '../light_match_screen/widgets/autolayouthor_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class LightMatchScreen extends StatefulWidget {
  @override
  State<LightMatchScreen> createState() => _LightMatchScreenState();
}

class _LightMatchScreenState extends State<LightMatchScreen> {
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

  List<Profile> modelsList = [];
  List<Profile> Matchedmodels = [];
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
    for (var i = 0; i < modelsList.length; i++) {
      if (modelsList[i].uid == FirebaseAuth.instance.currentUser!.uid) {
        if (modelsList[i].interests.contains(models[i].interests)) {
          setState(() {
            Matchedmodels.add(models[i]);
          });
        }
        setState(() {});
        modelsList.remove(modelsList[i]);
      }
    }
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    // d = allData;
    // print(allData);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            VerticalSpace(height: 30),
            Container(
              width: size.width,
              margin: getMargin(right: 20, left: 20),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            top: 5,
                            bottom: 4,
                          ),
                          child: Text(
                            "Match",
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
                  // CustomIconButton(
                  //   height: 44,
                  //   width: 44,
                  //   shape: IconButtonShape.RoundedBorder12,
                  //   padding: IconButtonPadding.PaddingAll13,
                  //   onTap: () {
                  //     // showModalBottomSheet(
                  //     //     context: context,
                  //     //     isScrollControlled: true,
                  //     //     builder: (context) {
                  //     //       return HomefilterbottomsheetPage();
                  //     //     });
                  //   },
                  //   child: CommonImageView(
                  //     svgPath: ImageConstant.imgMenu44X44,
                  //   ),
                  // ),
                ],
              ),
            ),
            VerticalSpace(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(top: 31, right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "New Match",
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
                          Padding(
                            padding: getPadding(
                              left: 0,
                              top: 2,
                              bottom: 1,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LightSeeAllMatchScreen()),
                                );
                              },
                              child: Text(
                                "See all",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorConstant.redA200,
                                  fontSize: getFontSize(
                                    16,
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
                    Container(
                      height: getVerticalSize(
                        330.00,
                      ),
                      margin: getMargin(
                        top: 28,
                        right: 0,
                      ),
                      child: Matchedmodels.length == 0
                          ? Center(
                              child: Text('Currently no User Matched with you'))
                          : ListView.builder(
                              padding: getPadding(left: 20, right: 20),
                              itemCount: Matchedmodels.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LightHomeMatchDetailsScreen(
                                                age: Matchedmodels[index].age,
                                                name: Matchedmodels[index]
                                                    .userName,
                                                bio: Matchedmodels[index].bio,
                                                interests: Matchedmodels[index]
                                                    .interests,
                                                job: Matchedmodels[index]
                                                    .jobTitle,
                                                url: Matchedmodels[index]
                                                    .profilePic,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    padding: getPadding(left: 10, right: 10),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              40.00,
                                            ),
                                          ),
                                          child: CommonImageView(
                                            url:
                                                Matchedmodels[index].profilePic,
                                            height: getVerticalSize(
                                              320.00,
                                            ),
                                            width: getHorizontalSize(236),
                                          ),
                                        ),
                                        Container(
                                          width: getHorizontalSize(236),
                                          height: getVerticalSize(320),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                40.00,
                                              ),
                                            ),
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
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: getPadding(
                                                left: 30,
                                                top: 0,
                                                right: 30,
                                              ),
                                              child: Text(
                                                "${Matchedmodels[index].userName},${Matchedmodels[index].age}",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  fontSize: getFontSize(
                                                    23,
                                                  ),
                                                  fontFamily: 'Source Sans Pro',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 30,
                                                top: 7,
                                                right: 30,
                                                bottom: 30,
                                              ),
                                              child: Text(
                                                Matchedmodels[index].jobTitle,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  fontSize: getFontSize(
                                                    16,
                                                  ),
                                                  fontFamily: 'Source Sans Pro',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    Padding(
                      padding: getPadding(top: 29, right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "All Match",
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
                          Padding(
                            padding: getPadding(
                              left: 0,
                              top: 2,
                              bottom: 1,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LightSeeAllMatchScreen()),
                                );
                              },
                              child: Text(
                                "See all",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorConstant.redA200,
                                  fontSize: getFontSize(
                                    16,
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: getVerticalSize(
                          285.00,
                        ),
                        width: getHorizontalSize(
                          488.00,
                        ),
                        child: ListView.builder(
                          padding: getPadding(
                              top: 28, bottom: 28, left: 20, right: 20),
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: modelsList.length,
                          itemBuilder: (context, index) {
                            // if (Matchedmodels[index].uid ==
                            //     FirebaseAuth.instance.currentUser!.uid) {
                            //   Matchedmodels.remove(Matchedmodels[index]);
                            // }
                            return AutolayouthorItemWidget(
                              index: index,
                              personList: modelsList,
                            );
                          },
                        ),
                      ),
                    ),
                    VerticalSpace(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
