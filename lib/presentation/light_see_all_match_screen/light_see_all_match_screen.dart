import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kencan/models/profile_model.dart';
import 'package:kencan/widgets/spacing.dart';
import '../../models/person.dart';
import '../light_see_all_match_screen/widgets/gridannete_counter_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class LightSeeAllMatchScreen extends StatefulWidget {
  @override
  State<LightSeeAllMatchScreen> createState() => _LightSeeAllMatchScreenState();
}

class _LightSeeAllMatchScreenState extends State<LightSeeAllMatchScreen> {
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
  late Profile model;
  List<Profile> modelsList = [];
  List<Profile> matchedUsers = [];
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('profile');

  void matchUser() {
    for (var i = 0; i < modelsList.length; i++) {
      if (model.interests.contains(modelsList[i].interests)) {
        setState(() {
          matchedUsers.add(modelsList[i]);
        });
      }
    }
  }

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

    for (var i = 0; i < models.length; i++) {
      if (modelsList[i].uid == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          model = modelsList[i];
        });
        if (modelsList[i].interests.contains(models[i].interests)) {
          setState(() {
            matchedUsers.add(models[i]);
          });
        }
        //modelsList.remove(modelsList[i]);

      }
    }

    for (var i = 0; i < modelsList.length; i++) {
      if (modelsList[i].uid == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {});
        modelsList.remove(modelsList[i]);
        matchUser();
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
    bool isRtl = context.locale == Constants.arLocal;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            VerticalSpace(height: 26),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width,
                margin: getMargin(
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 4,
                        top: 0,
                        bottom: 6,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: getPadding(
                              top: 0,
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
                          HorizontalSpace(width: 20),
                          Padding(
                            padding: getPadding(
                              left: 0,
                            ),
                            child: Text(
                              "All Match (${modelsList.length})",
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // CustomIconButton(
                        //   height: 44,
                        //   width: 44,
                        //   margin: getMargin(
                        //     left: 16,
                        //   ),
                        //   shape: IconButtonShape.RoundedBorder12,
                        //   padding: IconButtonPadding.PaddingAll13,
                        //   child: CommonImageView(
                        //     svgPath: ImageConstant.imgMenu44X44,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    margin: getMargin(
                      left: 24,
                      top: 10,
                      bottom: 30,
                      right: 24,
                    ),
                    // decoration: BoxDecoration(
                    //   color: ColorConstant.whiteA700,
                    // ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: getVerticalSize(
                                245.00,
                              ),
                              crossAxisCount: 2,
                              mainAxisSpacing: getHorizontalSize(
                                20.00,
                              ),
                              crossAxisSpacing: getHorizontalSize(
                                20.00,
                              ),
                            ),
                            physics: BouncingScrollPhysics(),
                            itemCount: modelsList.length,
                            itemBuilder: (context, index) {
                              return GridanneteCounterItemWidget(
                                index: index,
                                personList: modelsList,
                              );
                            },
                          ),
                        ),
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
