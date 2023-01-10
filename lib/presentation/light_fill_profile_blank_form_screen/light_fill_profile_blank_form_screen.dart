import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kencan/Utilis/utilis.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/domain/firestore/firestore.dart';
import 'package:kencan/domain/firestore/storage.dart';
import 'package:kencan/presentation/light_add_photos_screen/light_add_photos_screen.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/widgets/custom_button.dart';
import 'package:kencan/widgets/custom_icon_button.dart';
import 'package:kencan/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LightFillProfileBlankFormScreen extends StatefulWidget {
  @override
  State<LightFillProfileBlankFormScreen> createState() =>
      _LightFillProfileBlankFormScreenState();
}

class _LightFillProfileBlankFormScreenState
    extends State<LightFillProfileBlankFormScreen> {
  String? value2;
  List<String> dropdownItemList2 = [
    "Male",
    "  Female",
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController locController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  Uint8List? img;

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
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      body: SafeArea(
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
                  Padding(
                    padding: getPadding(
                      left: 24,
                    ),
                    child: Text(
                      "Fill Your Profile",
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: getSize(
                          124.00,
                        ),
                        width: getSize(
                          124.00,
                        ),
                        margin: getMargin(
                          left: 24,
                          top: 34,
                          right: 24,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    137.78,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    pickImage().then((value) async {
                                      var url = await StorageMethods()
                                          .uploadImageToSource('', img!, '');
                                      provider.setPic(url);
                                    });
                                    // Provider.of<ProfileProvider>(context)
                                    //     .setPic(img!);
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: img != null
                                        ? Image.memory(
                                            img!,
                                            fit: BoxFit.cover,
                                          )
                                        : const Icon(Icons.image),
                                  ),
                                ),
                              ),
                            ),
                            CustomIconButton(
                              height: 24,
                              width: 24,
                              margin: getMargin(
                                left: 10,
                                top: 10,
                              ),
                              variant: IconButtonVariant.FillRedA200,
                              shape: IconButtonShape.RoundedBorder12,
                              padding: IconButtonPadding.PaddingAll4,
                              alignment: Alignment.bottomRight,
                              child: CommonImageView(
                                svgPath: ImageConstant.imgMainedit,
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
                          top: 24,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color: ColorConstant.bluegray800A2,
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
                              controller: nameController,
                              isDark: isDark,
                              width: 380,
                              focusNode: FocusNode(),
                              hintText: "Full Name",
                              margin: getMargin(
                                top: 11,
                              ),
                              variant: TextFormFieldVariant.OutlineBluegray50,
                              fontStyle: TextFormFieldFontStyle
                                  .SourceSansProSemiBold16Gray300,
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
                          top: 24,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "Age",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.bluegray800A2,
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
                              controller: ageController,
                              isDark: isDark,
                              width: 380,
                              focusNode: FocusNode(),
                              hintText: "Age",
                              margin: getMargin(
                                top: 11,
                              ),
                              variant: TextFormFieldVariant.OutlineBluegray50,
                              fontStyle: TextFormFieldFontStyle
                                  .SourceSansProSemiBold16Gray300,
                              alignment: Alignment.centerLeft,
                              suffix: Container(
                                margin: getMargin(
                                  left: 30,
                                  top: 16,
                                  right: 26,
                                  bottom: 16,
                                ),
                                child: CommonImageView(
                                  svgPath:
                                      ImageConstant.imgVectorBluegray40016X20,
                                ),
                              ),
                              suffixConstraints: BoxConstraints(
                                minWidth: getHorizontalSize(
                                  20.00,
                                ),
                                minHeight: getVerticalSize(
                                  16.00,
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
                          top: 24,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color: ColorConstant.bluegray800A2,
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
                              controller: phoneController,
                              isDark: isDark,
                              width: 380,
                              focusNode: FocusNode(),
                              hintText: "Phone Number",
                              margin: getMargin(
                                top: 11,
                              ),
                              variant: TextFormFieldVariant.OutlineBluegray50,
                              fontStyle: TextFormFieldFontStyle
                                  .SourceSansProSemiBold16Gray300,
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
                      child: Container(
                        width: double.infinity,
                        margin: getMargin(
                          left: 24,
                          top: 24,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "Gender",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.bluegray800A2,
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
                            Container(
                              margin: getMargin(top: 16),
                              height: getVerticalSize(50),
                              width: getHorizontalSize(380),
                              padding: getPadding(left: 20, right: 20, top: 18),
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
                                borderRadius: BorderRadius.circular(20),
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
                                    'Gender',
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
                                      this.value2 = value.toString();

                                      provider.setGender(this.value2!);
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
                                  selectedItemBuilder: (BuildContext context) {
                                    return dropdownItemList2
                                        .map((String value) {
                                      return Text(
                                        value,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: isDark
                                              ? Colors.white
                                              : ColorConstant.black900,
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
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        margin: getMargin(
                          left: 24,
                          top: 24,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "Location",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.bluegray800A2,
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
                              controller: locController,
                              isDark: isDark,
                              width: 380,
                              focusNode: FocusNode(),
                              hintText: "Location",
                              margin: getMargin(
                                top: 11,
                              ),
                              variant: TextFormFieldVariant.OutlineBluegray50,
                              fontStyle: TextFormFieldFontStyle
                                  .SourceSansProSemiBold16Gray300,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: getMargin(
                top: 15,
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
                    text: "Continue",
                    margin: getMargin(
                      left: 24,
                      top: 24,
                      right: 24,
                      bottom: 20,
                    ),
                    onTap: () {
                      provider.setLocation(locController.text);
                      provider.setName(nameController.text);
                      provider.setPhone(phoneController.text);
                      FireStoreMethods().uploadingProfile(
                          nameController.text,
                          provider.profilePic,
                          '',
                          [],
                          [],
                          provider.gender,
                          '',
                          phoneController.text,
                          locController.text,
                          ageController.text,
                          provider.country,
                          context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LightAddPhotosScreen()),
                      );
                    },
                    variant: ButtonVariant.FillRed200,
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
