import 'package:kencan/widgets/spacing.dart';
import '../light_settings_invite_friends_screen/widgets/listestherhoward_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';

class LightSettingsInviteFriendsScreen extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
bool isRtl = context.locale==Constants.arLocal;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: size.width,
              margin: getMargin(
            left: 24,
            top: 35,
            right: 24,
            bottom: 20
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
                      isDark: isDark,
                      isRtl:isRtl,
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
                      "Invite Friends",
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
                child: Container(
                  width: double.infinity,
                  margin: getMargin(
                    top: 0,
                  ),
                
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                          padding: getPadding(
                            left: 20,
                            right: 20
                          ),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return ListestherhowardItemWidget();
                          },
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
