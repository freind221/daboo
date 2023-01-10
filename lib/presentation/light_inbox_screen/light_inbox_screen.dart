import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kencan/models/profile_model.dart';
import 'package:kencan/widgets/spacing.dart';
import '../../models/person.dart';
import '../light_inbox_screen/widgets/listellipse_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_icon_button.dart';
import 'package:kencan/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LightInboxScreen extends StatefulWidget {
  @override
  State<LightInboxScreen> createState() => _LightInboxScreenState();
}

class _LightInboxScreenState extends State<LightInboxScreen> {
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
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: size.width,
              margin: getMargin(left: 20, right: 20, top: 30),
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
                            "Inbox",
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
                      //   shape: IconButtonShape.RoundedBorder12,
                      //   padding: IconButtonPadding.PaddingAll13,
                      //   child: CommonImageView(
                      //     svgPath: ImageConstant.imgVectorRedA20044X44,
                      //   ),
                      // ),
                      HorizontalSpace(width: 16),
                      // CustomIconButton(
                      //   height: 44,
                      //   width: 44,
                      //   shape: IconButtonShape.RoundedBorder12,
                      //   padding: IconButtonPadding.PaddingAll13,
                      //   child: CommonImageView(
                      //     imagePath: ImageConstant.threeDots,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: getMargin(top: 26, bottom: 26, left: 20, right: 20),
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
                  // CustomTextFormField(

                  //   isDark: isDark,
                  //   width: size.width,
                  //   focusNode: FocusNode(),
                  //   hintText: "Search",
                  //   variant: TextFormFieldVariant.FillGray100,
                  //   shape: TextFormFieldShape.RoundedBorder2,
                  //   fontStyle: TextFormFieldFontStyle.SourceSansProRegular14,
                  //   textInputAction: TextInputAction.done,
                  //   alignment: Alignment.centerLeft,
                  //   suffix: Container(
                  //     margin: getMargin(
                  //       left: 30,
                  //       top: 12,
                  //       right: 29,
                  //       bottom: 15,
                  //     ),
                  //     child: CommonImageView(
                  //       svgPath: ImageConstant.imgVectorBluegray40017X17,
                  //     ),
                  //   ),
                  //   suffixConstraints: BoxConstraints(
                  //     minWidth: getHorizontalSize(
                  //       17.00,
                  //     ),
                  //     minHeight: getVerticalSize(
                  //       17.00,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: getPadding(left: 20, right: 20, top: 10, bottom: 90),

                // physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: modelsList.length,
                itemBuilder: (context, index) {
                  return ListellipseItemWidget(
                    index: index,
                    personList: modelsList,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
