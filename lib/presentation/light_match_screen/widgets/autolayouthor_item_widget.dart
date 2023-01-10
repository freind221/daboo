import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/models/profile_model.dart';
import '../../../models/person.dart';
import '../../light_home_match_details_screen/light_home_match_details_screen.dart';

// ignore: must_be_immutable
class AutolayouthorItemWidget extends StatelessWidget {
  List<Profile> personList = [];
  int index;
  AutolayouthorItemWidget({required this.personList, required this.index});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: getMargin(
            right: 16,
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LightHomeMatchDetailsScreen(
                          age: personList[index].age,
                          name: personList[index].userName,
                          bio: personList[index].bio,
                          interests: personList[index].interests,
                          job: personList[index].jobTitle,
                          url: personList[index].profilePic,
                        )),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        24.00,
                      ),
                    ),
                    child: CommonImageView(
                      url: personList[index].profilePic,
                      height: getVerticalSize(
                        160.00,
                      ),
                      width: getHorizontalSize(
                        110.00,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 27,
                    top: 13,
                    right: 27,
                  ),
                  child: Text(
                    personList[index].userName,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: getFontSize(
                        18,
                      ),
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 27,
                    top: 8,
                    right: 27,
                    bottom: 2,
                  ),
                  child: Text(
                    personList[index].age,
                    overflow: TextOverflow.ellipsis,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
