import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kencan/Utilis/utilis.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/domain/firestore/firestore.dart';
import 'package:kencan/domain/firestore/storage.dart';
import 'package:kencan/models/profile_model.dart';
import 'package:kencan/presentation/light_select_interest_screen/light_select_interest_screen.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/providers/user_provider.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/spacing.dart';
import 'package:provider/provider.dart';

class LightAddPhotosScreen extends StatefulWidget {
  @override
  State<LightAddPhotosScreen> createState() => _LightAddPhotosScreenState();
}

class _LightAddPhotosScreenState extends State<LightAddPhotosScreen> {
  Uint8List? img;
  Uint8List? img1;
  Uint8List? img2;
  Uint8List? img3;
  Uint8List? img4;
  StorageMethods storageMethods = StorageMethods();
  List<String> image = [];

  void setImage1(Uint8List? img) {
    setState(() {
      img1 = img;
    });
  }

  void setImage2(Uint8List? img) {
    setState(() {
      img2 = img;
    });
  }

  void setImage3(Uint8List? img) {
    setState(() {
      img3 = img;
    });
  }

  void setImage4(Uint8List? img) {
    setState(() {
      img4 = img;
    });
  }

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
  }

  Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    try {
      if (result != null) {
        if (kIsWeb) {
          Uint8List fileBytes = result.files.single.bytes!;
          return fileBytes;
        }
        Uint8List file = await File(result.files.single.path!).readAsBytes();
        // ignore: unnecessary_null_comparison
        if (file != null) {
          Utilis.toatsMessage('Image Picked');
          setState(() {});
          img = file;
        } else {
          Utilis.toatsMessage("No Image Selected");
        }
      }
    } catch (e) {
      Utilis.toatsMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            "Add Your Best Photos",
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
                      348.00,
                    ),
                    margin: getMargin(
                      left: 24,
                      top: 40,
                      right: 24,
                    ),
                    child: Text(
                      "Add your best photos to get a higher amount of daily matches.",
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
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 24,
                        top: 29,
                        right: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  12.00,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  //getModel(context);
                                  pickImage().then((value) async {
                                    var url = await storageMethods
                                        .uploadImageToSource(
                                            'childName', img!, '');
                                    setImage1(img);
                                    setState(() {
                                      image.add(url.toString());
                                      provider.setImages(image);
                                    });
                                    print("=========" + provider.images[0]);
                                  });
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    height: getVerticalSize(190),
                                    width: getHorizontalSize(180),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.redA20019,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          12.00,
                                        ),
                                      ),
                                    ),
                                    child: provider.images.length != 0
                                        ? provider.images[0] != null
                                            ? Image.network(provider.images[0])
                                            : Align(
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  ImageConstant.add,
                                                  width: getHorizontalSize(50),
                                                  height: getVerticalSize(50),
                                                ),
                                              )
                                        : Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              ImageConstant.add,
                                              width: getHorizontalSize(50),
                                              height: getVerticalSize(50),
                                            ),
                                          )
                                    // child: Image.memory(provider.profilePic!=null?provider.profilePic:),
                                    ),
                              )),
                          HorizontalSpace(width: 16),
                          InkWell(
                            onTap: () {
                              pickImage().then((value) async {
                                var url = await storageMethods
                                    .uploadImageToSource('childName', img!, '');

                                setState(() {
                                  image.add(url.toString());
                                  provider.setImages(image);
                                  img = null;
                                });
                              });
                            },
                            child: Container(
                              decoration: DottedDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorConstant.redA200,
                                shape: Shape.box,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(190),
                                width: getHorizontalSize(180),
                                decoration: BoxDecoration(
                                  color: ColorConstant.redA20019,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      12.00,
                                    ),
                                  ),
                                ),
                                child: provider.images.length >= 2
                                    ? provider.images[1] != ''
                                        ? Image.network(provider.images[1])
                                        : Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              ImageConstant.add,
                                              width: getHorizontalSize(50),
                                              height: getVerticalSize(50),
                                            ),
                                          )
                                    : Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          ImageConstant.add,
                                          width: getHorizontalSize(50),
                                          height: getVerticalSize(50),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 24,
                        top: 16,
                        right: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              pickImage().then((value) async {
                                var url = await storageMethods
                                    .uploadImageToSource('childName', img!, '');

                                setState(() {
                                  image.add(url.toString());
                                  provider.setImages(image);
                                  img = null;
                                });
                              });
                            },
                            child: Container(
                              decoration: DottedDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorConstant.redA200,
                                shape: Shape.box,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(190),
                                width: getHorizontalSize(180),
                                decoration: BoxDecoration(
                                  color: ColorConstant.redA20019,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      12.00,
                                    ),
                                  ),
                                ),
                                child: provider.images.length >= 3
                                    ? provider.images[2] != ''
                                        ? Image.network(provider.images[2])
                                        : Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              ImageConstant.add,
                                              width: getHorizontalSize(50),
                                              height: getVerticalSize(50),
                                            ),
                                          )
                                    : Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          ImageConstant.add,
                                          width: getHorizontalSize(50),
                                          height: getVerticalSize(50),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          HorizontalSpace(width: 16),
                          InkWell(
                            onTap: () {
                              pickImage().then((value) async {
                                var url = await storageMethods
                                    .uploadImageToSource('childName', img!, '');

                                setState(() {
                                  image.add(url.toString());
                                  provider.setImages(image);
                                  img = null;
                                });
                              });
                            },
                            child: Container(
                              decoration: DottedDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorConstant.redA200,
                                shape: Shape.box,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(190),
                                width: getHorizontalSize(180),
                                decoration: BoxDecoration(
                                  color: ColorConstant.redA20019,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      12.00,
                                    ),
                                  ),
                                ),
                                child: provider.images.length >= 4
                                    ? provider.images[3] != ''
                                        ? Image.network(provider.images[3])
                                        : Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              ImageConstant.add,
                                              width: getHorizontalSize(50),
                                              height: getVerticalSize(50),
                                            ),
                                          )
                                    : Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          ImageConstant.add,
                                          width: getHorizontalSize(50),
                                          height: getVerticalSize(50),
                                        ),
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
            Container(
              width: double.infinity,
              margin: getMargin(
                top: 0,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
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
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LightSelectInterestScreen()),
                        );
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
}
