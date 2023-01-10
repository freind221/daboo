import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kencan/main.dart';
import 'package:kencan/presentation/light_edit_profile_screen/light_edit_profile_screen.dart';
import 'package:kencan/presentation/light_profile_settings_screen/setting_language.dart';
import 'package:kencan/presentation/light_settings_invite_friends_screen/light_settings_invite_friends_screen.dart';
import 'package:kencan/presentation/light_settings_notification_screen/light_settings_notification_screen.dart';
import 'package:kencan/presentation/light_settings_security_screen/light_settings_security_screen.dart';
import 'package:kencan/presentation/logoutbottomsheet_page/logoutbottomsheet_page.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/widgets/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';

class LightProfileSettingsScreen extends StatefulWidget {
  @override
  State<LightProfileSettingsScreen> createState() =>
      _LightProfileSettingsScreenState();
}

class _LightProfileSettingsScreenState
    extends State<LightProfileSettingsScreen> {
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
              margin: getMargin(top: 34, bottom: 20, left: 20, right: 20),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          ImageConstant.appLogo,
                          height: getVerticalSize(36),
                          width: getHorizontalSize(36),
                        ),
                        HorizontalSpace(width: 20),
                        Padding(
                          padding: getPadding(
                            left: 0,
                            top: 5,
                            bottom: 4,
                          ),
                          child: Text(
                            "Profile",
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
                      CustomIconButton(
                        height: 44,
                        width: 44,
                        shape: IconButtonShape.RoundedBorder12,
                        padding: IconButtonPadding.PaddingAll13,
                        child: CommonImageView(
                          svgPath: ImageConstant.imgVectorRedA20044X44,
                        ),
                      ),
                      HorizontalSpace(width: 16),
                      CustomIconButton(
                        height: 44,
                        width: 44,
                        shape: IconButtonShape.RoundedBorder12,
                        padding: IconButtonPadding.PaddingAll13,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LightEditProfileScreen()),
                          );
                        },
                        child: CommonImageView(
                          imagePath: ImageConstant.threeDots,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: getMargin(
                    bottom: 100,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: getMargin(
                          left: 24,
                          right: 24,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: getSize(
                                  120.00,
                                ),
                                width: getSize(
                                  120.00,
                                ),
                                margin: getMargin(
                                  left: 121,
                                  top: 26,
                                  right: 121,
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            133.33,
                                          ),
                                        ),
                                        child: CommonImageView(
                                          url: provider.profilePic,
                                          height: getSize(
                                            120.00,
                                          ),
                                          width: getSize(
                                            120.00,
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
                              child: Padding(
                                padding: getPadding(
                                  left: 121,
                                  top: 18,
                                  right: 121,
                                ),
                                child: Text(
                                  provider.userName,
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
                            ),
                            CustomDivider(
                              isDark: isDark,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LightEditProfileScreen()),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageConstant.editProfile,
                                        width: getHorizontalSize(56),
                                        height: getVerticalSize(56),
                                      ),
                                      HorizontalSpace(width: 20),
                                      Text(
                                        "Edit profile",
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
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorConstant.redA200,
                                    size: getSize(16),
                                  )
                                ],
                              ),
                            ),
                            CustomDivider(
                              isDark: isDark,
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               LightSettingsNotificationScreen()),
                            //     );
                            //   },
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Image.asset(
                            //             ImageConstant.notification,
                            //             width: getHorizontalSize(56),
                            //             height: getVerticalSize(56),
                            //           ),
                            //           HorizontalSpace(width: 20),
                            //           Text(
                            //             "Notification",
                            //             overflow: TextOverflow.ellipsis,
                            //             textAlign: TextAlign.start,
                            //             style: TextStyle(
                            //               fontSize: getFontSize(
                            //                 16,
                            //               ),
                            //               fontFamily: 'Source Sans Pro',
                            //               fontWeight: FontWeight.w600,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       Icon(
                            //         Icons.arrow_forward_ios,
                            //         color: ColorConstant.redA200,
                            //         size: getSize(16),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // CustomDivider(
                            //   isDark: isDark,
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               LightSettingsSecurityScreen()),
                            //     );
                            //   },
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Image.asset(
                            //             ImageConstant.security,
                            //             width: getHorizontalSize(56),
                            //             height: getVerticalSize(56),
                            //           ),
                            //           HorizontalSpace(width: 20),
                            //           Text(
                            //             "Security",
                            //             overflow: TextOverflow.ellipsis,
                            //             textAlign: TextAlign.start,
                            //             style: TextStyle(
                            //               fontSize: getFontSize(
                            //                 16,
                            //               ),
                            //               fontFamily: 'Source Sans Pro',
                            //               fontWeight: FontWeight.w600,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       Icon(
                            //         Icons.arrow_forward_ios,
                            //         color: ColorConstant.redA200,
                            //         size: getSize(16),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // CustomDivider(
                            //   isDark: isDark,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      ImageConstant.darkMode,
                                      width: getHorizontalSize(56),
                                      height: getVerticalSize(56),
                                    ),
                                    HorizontalSpace(width: 20),
                                    Text(
                                      "Dark Mode",
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
                                  ],
                                ),
                                FlutterSwitch(
                                  value:
                                      themeManager.themeMode == ThemeMode.dark,
                                  height: getHorizontalSize(32),
                                  width: getHorizontalSize(56),
                                  toggleSize: 24,
                                  borderRadius: getHorizontalSize(
                                    16.00,
                                  ),
                                  activeColor: ColorConstant.redA200,
                                  activeToggleColor: ColorConstant.whiteA700,
                                  inactiveColor: ColorConstant.gray500,
                                  inactiveToggleColor: ColorConstant.whiteA700,
                                  onToggle: (value) {
                                    themeManager.toggleTheme(value);
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                            CustomDivider(isDark: isDark),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return LightSettingsLanguageScreen();
                                      });
                                },
                                child: Padding(
                                  padding: getPadding(
                                    left: 0,
                                    top: 10,
                                    bottom: 10,
                                    right: 0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              top: 1,
                                              bottom: 1,
                                            ),
                                            child: CommonImageView(
                                              imagePath: ImageConstant.security,
                                              height: getSize(
                                                56.00,
                                              ),
                                              width: getSize(
                                                56.00,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: getHorizontalSize(20)),
                                          Text(
                                            "Language",
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
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            isRtl ? "العربية" : "English (US)",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: getFontSize(
                                                16,
                                              ),
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                              width: getHorizontalSize(20)),
                                          Padding(
                                            padding: getPadding(
                                              top: 6,
                                              bottom: 6,
                                            ),
                                            child: RotatedBox(
                                              quarterTurns: 2,
                                              child:
                                                  CommonImageViewWithDarkOption(
                                                isDark: isDark,
                                                isRtl: isRtl,
                                                svgPath:
                                                    ImageConstant.imgArrowleft,
                                                height: getVerticalSize(
                                                  15.00,
                                                ),
                                                width: getHorizontalSize(
                                                  7.00,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //CustomDivider(isDark: isDark),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               LightSettingsInviteFriendsScreen()),
                            //     );
                            //   },
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Image.asset(
                            //             ImageConstant.inviteFriends,
                            //             width: getHorizontalSize(56),
                            //             height: getVerticalSize(56),
                            //           ),
                            //           HorizontalSpace(width: 20),
                            //           Text(
                            //             "Invite Friends",
                            //             overflow: TextOverflow.ellipsis,
                            //             textAlign: TextAlign.start,
                            //             style: TextStyle(
                            //               fontSize: getFontSize(
                            //                 16,
                            //               ),
                            //               fontFamily: 'Source Sans Pro',
                            //               fontWeight: FontWeight.w600,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       Icon(
                            //         Icons.arrow_forward_ios,
                            //         color: ColorConstant.redA200,
                            //         size: getSize(16),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            CustomDivider(isDark: isDark),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return LogoutbottomsheetPage();
                                    });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageConstant.logout,
                                        width: getHorizontalSize(56),
                                        height: getVerticalSize(56),
                                      ),
                                      HorizontalSpace(width: 20),
                                      Text(
                                        "Logout",
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
