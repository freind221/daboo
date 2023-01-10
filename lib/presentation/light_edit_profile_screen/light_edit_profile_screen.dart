import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/domain/firestore/firestore.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/custom_text_form_field.dart';
import 'package:kencan/widgets/spacing.dart';
import 'package:provider/provider.dart';

class LightEditProfileScreen extends StatefulWidget {
  @override
  State<LightEditProfileScreen> createState() => _LightEditProfileScreenState();
}

class _LightEditProfileScreenState extends State<LightEditProfileScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controllerAbout = TextEditingController();
  TextEditingController controllerAge = TextEditingController();

  Object? value2;
  List<String> dropdownItemList2 = [
    "Male",
    "  Female",
  ];
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
      provider.setName(snapshot.get('name'));
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

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                          top: 5,
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
                      HorizontalSpace(width: 20),
                      Padding(
                        padding: getPadding(
                          left: 0,
                        ),
                        child: Text(
                          "Edit Profile",
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: getMargin(
                              left: 24,
                              top: 34,
                              right: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2.00,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 0,
                                      top: 1,
                                      right: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            top: 3,
                                          ),
                                          child: Text(
                                            "Full Name",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: getFontSize(
                                                16,
                                              ),
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            bottom: 5,
                                          ),
                                          child: Text(
                                            "*",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.redA700A2,
                                              fontSize: getFontSize(
                                                14,
                                              ),
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  isDark: isDark,
                                  controller: controller1,
                                  width: 380,
                                  //focusNode: FocusNode(),
                                  hintText: provider.userName,
                                  margin: getMargin(
                                    top: 11,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: getMargin(
                              left: 24,
                              top: 12,
                              right: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2.00,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: getMargin(
                              left: 24,
                              top: 12,
                              right: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2.00,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 0,
                                      top: 1,
                                      right: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            top: 3,
                                          ),
                                          child: Text(
                                            "Phone Number",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: getFontSize(
                                                16,
                                              ),
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            bottom: 5,
                                          ),
                                          child: Text(
                                            "*",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.redA700A2,
                                              fontSize: getFontSize(
                                                14,
                                              ),
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  isDark: isDark,
                                  controller: controller2,
                                  width: 380,
                                  focusNode: FocusNode(),
                                  hintText: provider.phone,
                                  margin: getMargin(
                                    top: 11,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  suffix: Container(
                                    margin: getMargin(
                                      left: 30,
                                      top: 15,
                                      right: 27,
                                      bottom: 15,
                                    ),
                                    child: CommonImageView(
                                      svgPath: ImageConstant.imgCall,
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                    minWidth: getHorizontalSize(
                                      17.00,
                                    ),
                                    minHeight: getVerticalSize(
                                      17.00,
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
                              top: 12,
                              right: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        2.00,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: getPadding(
                                            left: 0,
                                            top: 1,
                                            right: 0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: getPadding(
                                                  top: 3,
                                                ),
                                                child: Text(
                                                  "Gender",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontSize: getFontSize(
                                                      16,
                                                    ),
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  bottom: 5,
                                                ),
                                                child: Text(
                                                  "*",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.redA700A2,
                                                    fontSize: getFontSize(
                                                      14,
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
                                      ),
                                      Container(
                                        margin: getMargin(top: 16),
                                        height: getVerticalSize(50),
                                        width: getHorizontalSize(180),
                                        padding: getPadding(
                                            left: 20, right: 20, top: 18),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: isDark
                                                ? ColorConstant.darkTextField
                                                : ColorConstant.bluegray50,
                                          ),
                                          color: isDark
                                              ? ColorConstant.darkTextField
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            autofocus: true,
                                            value: value2,
                                            isExpanded: true,
                                            icon: Container(
                                              height: getSize(
                                                8.33,
                                              ),
                                              width: getSize(
                                                10.00,
                                              ),
                                              child: Image.asset(
                                                ImageConstant.dropDownArrow,
                                                fit: BoxFit.fill,
                                                color: ColorConstant.gray500,
                                              ),
                                            ),
                                            hint: Text(
                                              provider.gender,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: ColorConstant.gray500,
                                                fontSize: getFontSize(
                                                  14,
                                                ),
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.w400,
                                                height: 1.00,
                                              ),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                this.value2 = value;
                                              });
                                            },
                                            items: dropdownItemList2
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  textAlign: TextAlign.start,
                                                ),
                                              );
                                            }).toList(),
                                            selectedItemBuilder:
                                                (BuildContext context) {
                                              return dropdownItemList2
                                                  .map((String value) {
                                                return Text(
                                                  value,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: isDark
                                                        ? Colors.white
                                                        : ColorConstant
                                                            .black900,
                                                    fontSize: getFontSize(
                                                      14,
                                                    ),
                                                    fontFamily: 'Urbanist',
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.00,
                                                  ),
                                                );
                                              }).toList();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: getMargin(
                                    left: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        2.00,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          left: 0,
                                          top: 1,
                                          right: 0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: getPadding(
                                                top: 6,
                                              ),
                                              child: Text(
                                                "Age",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: getFontSize(
                                                    16,
                                                  ),
                                                  fontFamily: 'Source Sans Pro',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                bottom: 9,
                                              ),
                                              child: Text(
                                                "*",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.redA700A2,
                                                  fontSize: getFontSize(
                                                    14,
                                                  ),
                                                  fontFamily: 'Source Sans Pro',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomTextFormField(
                                        isDark: isDark,
                                        controller: controllerAge,
                                        width: 184,
                                        focusNode: FocusNode(),
                                        hintText: provider.age,
                                        margin: getMargin(
                                          top: 11,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        suffix: Container(
                                          margin: getMargin(
                                            left: 30,
                                            top: 12,
                                            right: 24,
                                            bottom: 12,
                                          ),
                                          child: CommonImageView(
                                            svgPath: ImageConstant.imgMail,
                                          ),
                                        ),
                                        suffixConstraints: BoxConstraints(
                                          minWidth: getHorizontalSize(
                                            24.00,
                                          ),
                                          minHeight: getVerticalSize(
                                            24.00,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: getMargin(
                              left: 24,
                              top: 16,
                              right: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2.00,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 0,
                                      right: 0,
                                    ),
                                    child: Text(
                                      "About",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: getFontSize(
                                          16,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  isDark: isDark,
                                  controller: controllerAbout,
                                  maxLines: 3,
                                  width: 380,
                                  focusNode: FocusNode(),
                                  hintText: provider.bio,
                                  margin: getMargin(
                                    top: 11,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  suffixConstraints: BoxConstraints(
                                    minWidth: getHorizontalSize(
                                      17.00,
                                    ),
                                    minHeight: getVerticalSize(
                                      17.00,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: getMargin(
                              left: 24,
                              top: 12,
                              right: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2.00,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: getMargin(
                              left: 24,
                              top: 16,
                              right: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2.00,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 0,
                                      right: 0,
                                    ),
                                    child: Text(
                                      "Address",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: getFontSize(
                                          16,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  isDark: isDark,
                                  controller: controller3,
                                  width: 380,
                                  focusNode: FocusNode(),
                                  hintText: provider.location,
                                  margin: getMargin(
                                    top: 11,
                                  ),
                                  padding: TextFormFieldPadding.PaddingT18,
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.centerLeft,
                                  suffix: Container(
                                    margin: getMargin(
                                      left: 30,
                                      top: 14,
                                      right: 29,
                                      bottom: 14,
                                    ),
                                    child: CommonImageView(
                                      svgPath: ImageConstant.imgLocation,
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                    minWidth: getHorizontalSize(
                                      14.00,
                                    ),
                                    minHeight: getVerticalSize(
                                      19.00,
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 100),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      FireStoreMethods().updateProfile(
                          controller1.text,
                          value2.toString(),
                          controllerAbout.text,
                          controller2.text,
                          controller3.text,
                          controllerAge.text,
                          context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red),
                      child: const Center(
                        child: Text(
                          'Save Changes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
