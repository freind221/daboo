import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/widgets/spacing.dart';

// ignore: must_be_immutable
class ListestherhowardItemWidget extends StatefulWidget {

  ListestherhowardItemWidget();

  @override
  State<ListestherhowardItemWidget> createState() => _ListestherhowardItemWidgetState();
}

class _ListestherhowardItemWidgetState extends State<ListestherhowardItemWidget> {
  bool isInvited=false;

  @override
 Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: getMargin(
          top: 12.0,
          bottom: 12.0,
        ),
        decoration: BoxDecoration(
          color: isDark?ColorConstant.darkTextField:Colors.white,
          borderRadius: BorderRadius.circular(
            getHorizontalSize(
              12.00,
            ),
          ),
          border: Border.all(
            color:isDark?ColorConstant.darkLine: ColorConstant.bluegray50,
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
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      getHorizontalSize(
                        12.00,
                      ),
                    ),
                    bottomLeft: Radius.circular(
                      getHorizontalSize(
                        12.00,
                      ),
                    ),
                  ),
                  child: CommonImageView(
                    imagePath: ImageConstant.imgImage80X80,
                    height: getSize(
                      80.00,
                    ),
                    width: getSize(
                      80.00,
                    ),
                  ),
                ),
           
                      HorizontalSpace(width:16),
                      Container(
                        margin: getMargin(
                          left: 0,
                          top: 20,
                          bottom: 19,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Esther Howard",
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
                            Padding(
                              padding: getPadding(
                                top: 12,
                                right: 0,
                              ),
                              child: Text(
                                "+62-818-5551-71",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                     
                                  fontSize: getFontSize(
                                    11,
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
                  
                  
                 GestureDetector(
                  onTap: (){
                    setState(() {
                      isInvited=true;
                    });
                  },
                   child: Container(
                    padding: getPadding(
                      left: 22,
                      right: 22,
                      bottom: 8,
                      top: 8
                    ),
                    margin: getMargin(
                      right: 20,
                      left: 20
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConstant.redA200
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: isInvited?ColorConstant.redA200:Colors.transparent,
                    ),
                    child: Text(isInvited?"Invited":"Invite",
                    style: TextStyle(
                           color:isInvited? ColorConstant.whiteA700:ColorConstant.redA200,
                           fontSize: getFontSize(
                             18,
                           ),
                           fontFamily: 'Source Sans Pro',
                           fontWeight: FontWeight.w600,
                         ),
                    ),
                   ),
                 )
               
          
          ],
        ),
      ),
    );
  }
}
