import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/domain/firestore/firestore.dart';
import 'package:kencan/models/profile_model.dart';
import 'package:kencan/presentation/light_select_ideal_match_screen/light_select_ideal_match_screen.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/spacing.dart';
import 'package:provider/provider.dart';

import '../accountsetupsuccessfuldialog_page/accountsetupsuccessfuldialog_page.dart';

class LightSelectInterestScreen extends StatefulWidget {
  @override
  State<LightSelectInterestScreen> createState() =>
      _LightSelectInterestScreenState();
}

class _LightSelectInterestScreenState extends State<LightSelectInterestScreen> {
  int? defaultChoiceIndex;
  List<int> selectedInterests = [];
  List<dynamic> interests = [];

  getModel(BuildContext context) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('profile')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (snapshot.exists) {
      final provider = Provider.of<ProfileProvider>(context, listen: false);
      //print(snapshot.get('country'));
      //print(snapshot.get('images').runtimeType);
      provider.setCountry(snapshot.get('country'));
      provider.setBio(snapshot.get('bio'));
      provider.setGender(snapshot.get('gender'));
      provider.setImages(snapshot.get('images'));
      provider.setInterests(snapshot.get('interests'));
      provider.setJob(snapshot.get('jobTitle'));
      provider.setLocation(snapshot.get('location'));
      provider.setName(snapshot.get('name'));
      provider.setPhone(snapshot.get('phone'));
      provider.setPic(snapshot.get('profilePic'));
      provider.setAge(snapshot.get('age'));

      print("Data Exists");
      print(provider.country);
      // use the data from the snapshot
    } else {
      // the document does not exist
    }
  }

  @override
  void initState() {
    getModel(context);
    super.initState();
    defaultChoiceIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    margin: getMargin(
                      left: 28,
                      top: 35,
                      right: 28,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 4,
                            bottom: 5,
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
                            "Select Your Interest",
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
                    width: getHorizontalSize(
                      336.00,
                    ),
                    margin: getMargin(
                      left: 24,
                      top: 41,
                      right: 24,
                    ),
                    child: Text(
                      "Select your interests to match with users who have similar things in common.",
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
                  VerticalSpace(height: 20),
                  Padding(
                    padding: getPadding(left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        spacing: 10,
                        children: List<Widget>.generate(
                          interestsList.length,
                          (index) => ChoiceChip(
                            label: Text(
                              interestsList[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedInterests.contains(index)
                                    ? ColorConstant.whiteA700
                                    : ColorConstant.redA200,
                                fontSize: getFontSize(
                                  18,
                                ),
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            selected: selectedInterests.contains(index),
                            backgroundColor: Colors.transparent,
                            selectedColor: ColorConstant.redA200,
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(10)),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: ColorConstant.redA200),
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  21.50,
                                ),
                              ),
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectedInterests.add(index);
                                interests.add(interestsList[index]);
                                provider.setInterests(interests);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: getMargin(
                top: 0,
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
                      FireStoreMethods()
                          .uploadingProfile(
                              provider.userName,
                              provider.profilePic,
                              provider.job,
                              provider.images,
                              provider.interests,
                              provider.gender,
                              provider.bio,
                              provider.phone,
                              provider.location,
                              provider.age,
                              provider.country,
                              context)
                          .then((value) async {
                        CollectionReference _collectionRef =
                            FirebaseFirestore.instance.collection('profile');

                        QuerySnapshot querySnapshot =
                            await _collectionRef.get();

                        // Get data from docs and convert map to List
                        List<Profile> models = [];
                        querySnapshot.docs.forEach((document) {
                          models.add(Profile.fromSnap(document));
                        });
                        provider.setList(models);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AccountsetupsuccessfuldialogPage();
                            });
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> interestsList = [
    "👗 Fashion",
    "🎵 Music",
    "🎨 Painting",
    "🍔 Food & Drink",
    "🌇 Travel & Places",
    "🎮 Gaming",
    "💃🏻 Dancing",
    "🗣 Language",
    "🎬 Movie",
    "📸 Photography",
    "🏛 Architecture",
    "📚 Book",
    "✍🏻 Writing",
    "🍃 Nature",
    "⚽️ Football",
    "🙂 People",
    "🐼 Animals",
    "💪 Gym & Fitness",
  ];
}
