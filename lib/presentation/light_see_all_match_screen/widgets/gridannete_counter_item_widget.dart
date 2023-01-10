import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/models/profile_model.dart';
import '../../../models/person.dart';
import '../../light_home_match_details_screen/light_home_match_details_screen.dart';

// ignore: must_be_immutable
class GridanneteCounterItemWidget extends StatelessWidget {
  List<Profile> personList;
  int index;
  GridanneteCounterItemWidget({required this.personList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
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
        child: Container(
          height: getVerticalSize(
            244.00,
          ),
          width: getHorizontalSize(
            180.00,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    right: 1,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        40.00,
                      ),
                    ),
                    child: CommonImageView(
                      url: personList[index].profilePic,
                      height: getVerticalSize(
                        244.00,
                      ),
                      width: getHorizontalSize(
                        179.00,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: getVerticalSize(
                    244.00,
                  ),
                  width: getHorizontalSize(
                    179.00,
                  ),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 22,
                          top: 0,
                          right: 22,
                        ),
                        child: Text(
                          "${personList[index].userName},${personList[index].age}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorConstant.whiteA700,
                            fontSize: getFontSize(
                              20,
                            ),
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 22,
                          top: 7,
                          right: 22,
                          bottom: 10,
                        ),
                        child: Text(
                          personList[index].jobTitle,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorConstant.whiteA700,
                            fontSize: getFontSize(
                              14,
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
            ],
          ),
        ),
      ),
    );
  }
}
