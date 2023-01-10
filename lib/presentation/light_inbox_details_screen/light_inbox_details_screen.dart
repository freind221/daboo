import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kencan/core/app_export.dart';
import 'package:kencan/domain/firestore/firestore.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LightInboxDetailsScreen extends StatefulWidget {
  final String name;
  final String recieverId;
  final String url;
  final String age;
  LightInboxDetailsScreen(
      {required this.name,
      required this.recieverId,
      required this.url,
      required this.age});

  @override
  State<LightInboxDetailsScreen> createState() =>
      _LightInboxDetailsScreenState();
}

class _LightInboxDetailsScreenState extends State<LightInboxDetailsScreen> {
  TextEditingController textEditingController = TextEditingController();

  String chatRoomId = '';
  void setRoomId() {
    if (FirebaseAuth.instance.currentUser!.uid[0].toLowerCase().codeUnits[0] >
        widget.recieverId[0].toLowerCase().codeUnits[0]) {
      setState(() {
        chatRoomId = FirebaseAuth.instance.currentUser!.uid + widget.recieverId;
      });
    } else {
      setState(() {
        chatRoomId = widget.recieverId + FirebaseAuth.instance.currentUser!.uid;
      });
    }
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
    setRoomId();
    getModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.url),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.age,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //     Align(
            //       alignment: Alignment.center,
            //       child: Container(
            //         width: size.width,
            //         margin: getMargin(
            //           left: 24,
            //           top: 26,
            //           right: 24,
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisSize: MainAxisSize.max,
            //           children: [
            //             Padding(
            //               padding: getPadding(
            //                 left: 4,
            //                 top: 14,
            //                 bottom: 14,
            //               ),
            //               child: CommonImageView(
            //                 isBackBtn: true,
            //                 isRtl: isRtl,
            //                 imagePath: ImageConstant.imgArrowleft,
            //                 height: getSize(
            //                   15.00,
            //                 ),
            //                 width: getSize(
            //                   15.00,
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: getPadding(
            //                 top: 11,
            //                 bottom: 6,
            //               ),
            //               child: Text(
            //                 widget.name,
            //                 overflow: TextOverflow.ellipsis,
            //                 textAlign: TextAlign.start,
            //                 style: TextStyle(
            //                   fontSize: getFontSize(
            //                     26,
            //                   ),
            //                   fontFamily: 'Source Sans Pro',
            //                   fontWeight: FontWeight.w600,
            //                 ),
            //               ),
            //             ),
            //             CustomIconButton(
            //               height: 44,
            //               width: 44,
            //               shape: IconButtonShape.RoundedBorder12,
            //               padding: IconButtonPadding.PaddingAll13,
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) =>
            //                           LightInboxVoiceCallScreen()),
            //                 );
            //               },
            //               child: CommonImageView(
            //                 svgPath: ImageConstant.imgCall44X44,
            //               ),
            //             ),
            //             CustomIconButton(
            //               height: 44,
            //               width: 44,
            //               shape: IconButtonShape.RoundedBorder12,
            //               padding: IconButtonPadding.PaddingAll13,
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) =>
            //                           LightInboxVideoCallScreen()),
            //                 );
            //               },
            //               child: CommonImageView(
            //                 imagePath: ImageConstant.imgAutolayouthor44X44,
            //               ),
            //             ),
            //             // HorizontalSpace(width: 16),
            //             CustomIconButton(
            //               height: 44,
            //               width: 44,
            //               shape: IconButtonShape.RoundedBorder12,
            //               padding: IconButtonPadding.PaddingAll13,
            //               child: CommonImageView(
            //                 imagePath: ImageConstant.threeDots,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('question')
                      .doc(chatRoomId)
                      .collection('answers')
                      //.where('reciverId', isEqualTo: widget.recieverId)
                      //.where('senderId',
                      //  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("Start Chatting"),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('waiting');
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment: (snapshot.data!.docs[index]
                                          ['senderId'] ==
                                      FirebaseAuth.instance.currentUser!.uid
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (snapshot.data!.docs[index]
                                              ['senderId'] ==
                                          FirebaseAuth.instance.currentUser!.uid
                                      ? Colors.grey.shade200
                                      : Colors.blue[200]),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  snapshot.data!.docs[index]['message'],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        }));
                  })),
            ),
            CustomTextFormField(
              controller: textEditingController,
              isDark: isDark,
              width: 380,
              focusNode: FocusNode(),
              hintText: "Message ...",
              margin: getMargin(
                left: 24,
                top: 0,
                right: 24,
                bottom: 20,
              ),
              variant: TextFormFieldVariant.OutlineBluegray50,
              shape: TextFormFieldShape.RoundedBorder20,
              padding: TextFormFieldPadding.PaddingT27,
              fontStyle: TextFormFieldFontStyle.SourceSansProRegular16,
              textInputAction: TextInputAction.done,
              alignment: Alignment.center,
              suffix: InkWell(
                onTap: () {
                  FireStoreMethods().chat(
                      chatRoomId,
                      widget.recieverId,
                      DateTime.now().toString(),
                      provider.userName,
                      textEditingController.text,
                      FirebaseAuth.instance.currentUser!.uid,
                      context);
                  textEditingController.text = '';
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonImageView(
                    imagePath: ImageConstant.imgVector16X19,
                    height: getVerticalSize(
                      16.00,
                    ),
                    width: getHorizontalSize(
                      19.00,
                    ),
                  ),
                ),
              ),
              suffixConstraints: BoxConstraints(
                minWidth: getHorizontalSize(
                  19.00,
                ),
                minHeight: getVerticalSize(
                  16.00,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
