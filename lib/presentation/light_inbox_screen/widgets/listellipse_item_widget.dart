import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/models/profile_model.dart';
import 'package:kencan/presentation/light_inbox_details_screen/light_inbox_details_screen.dart';
import 'package:kencan/widgets/spacing.dart';
import '../../../models/person.dart';

// ignore: must_be_immutable
class ListellipseItemWidget extends StatefulWidget {
  List<Profile> personList;
  int index;
  ListellipseItemWidget({required this.index, required this.personList});

  @override
  State<ListellipseItemWidget> createState() => _ListellipseItemWidgetState();
}

class _ListellipseItemWidgetState extends State<ListellipseItemWidget> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LightInboxDetailsScreen(
                    name: widget.personList[widget.index].userName,
                    recieverId: widget.personList[widget.index].uid,
                    url: widget.personList[widget.index].profilePic,
                    age: widget.personList[widget.index].age,
                  )),
        );
      },
      child: Container(
        margin: getMargin(
          top: 8.0,
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
          color: isDark ? ColorConstant.darkTextField : ColorConstant.whiteA700,
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              16.00,
            ),
          ),
          border: Border.all(
            color: isDark ? ColorConstant.darkLine : ColorConstant.bluegray50,
            width: getHorizontalSize(
              1.00,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                left: 12,
                top: 12,
                bottom: 12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: getSize(
                      60.00,
                    ),
                    width: getSize(
                      60.00,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                30.00,
                              ),
                            ),
                            child: CommonImageView(
                              url: widget.personList[widget.index].profilePic,
                              height: getSize(
                                60.00,
                              ),
                              width: getSize(
                                60.00,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: getHorizontalSize(
                              12.00,
                            ),
                            margin: getMargin(
                              left: 10,
                              top: 10,
                              right: 5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: getSize(
                                      12.00,
                                    ),
                                    width: getSize(
                                      12.00,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.redA200,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          6.00,
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
                  HorizontalSpace(width: 20),
                  Container(
                    margin: getMargin(
                      left: 0,
                      top: 10,
                      bottom: 7,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.personList[widget.index].userName,
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
                        Padding(
                          padding: getPadding(
                            top: 9,
                            right: 10,
                          ),
                          child: Text(
                            "Haha oh man",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorConstant.bluegray700,
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
                ],
              ),
            ),
            Container(
              margin: getMargin(
                left: 0,
                top: 13,
                right: 32,
                bottom: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: getMargin(
                      left: 10,
                    ),
                    padding: getPadding(
                      left: 9,
                      top: 6,
                      right: 9,
                      bottom: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          12.50,
                        ),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(
                          1,
                          1.0024292469024658,
                        ),
                        end: Alignment(
                          0,
                          0.0024292469024658203,
                        ),
                        colors: [
                          ColorConstant.redA200,
                          ColorConstant.redA100,
                        ],
                      ),
                    ),
                    child: Text(
                      widget.personList[widget.index].jobTitle.toString(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstant.whiteA700,
                        fontSize: getFontSize(
                          11,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        top: 14,
                      ),
                      // child: Text(
                      //   personList[index].time,
                      //   overflow: TextOverflow.ellipsis,
                      //   textAlign: TextAlign.start,
                      //   style: TextStyle(
                      //     color: ColorConstant.gray600,
                      //     fontSize: getFontSize(
                      //       16,
                      //     ),
                      //     fontFamily: 'Source Sans Pro',
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                    ),
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
