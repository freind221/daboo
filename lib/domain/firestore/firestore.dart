import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:kencan/Utilis/utilis.dart';
import 'package:kencan/domain/firestore/storage.dart';
import 'package:kencan/models/profile_model.dart';
import 'package:kencan/providers/user_provider.dart';
import 'package:provider/provider.dart';

class FireStoreMethods {
  final StorageMethods storageMethods = StorageMethods();
  final _firestore = FirebaseFirestore.instance;

  Future<Profile> getData(BuildContext context) async {
    DocumentSnapshot snapshot = await _firestore
        .collection('profile')
        .doc(Provider.of<UserProvide>(context).user.uid)
        .get();

    if (snapshot.exists) {
      return Profile.fromSnap(snapshot);
    } else {
      throw "no Data";
    }
  }

  Future<String> uploadingProfile(
      String userName,
      String? file,
      String jobTitle,
      List<dynamic> images,
      List<dynamic> interests,
      String gender,
      String bio,
      String phone,
      String location,
      String country,
      String age,
      BuildContext context) async {
    String channelID = '';

    try {
      // var url = '';
      // if (file != null) {
      //   url = await storageMethods.uploadImageToSource(
      //       'profile', file, DateTime.now().millisecondsSinceEpoch.toString());
      // }
      final String channelId = DateTime.now().millisecondsSinceEpoch.toString();
      final provider = Provider.of<UserProvide>(context, listen: false).user;
      channelID = channelId;
      Profile profile = Profile(
          uid: FirebaseAuth.instance.currentUser!.uid,
          userName: userName,
          profilePic: file!,
          jobTitle: jobTitle,
          images: images,
          interests: interests,
          phone: phone,
          location: location,
          gender: gender,
          bio: bio,
          age: age,
          country: country);
      _firestore
          .collection('profile')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(profile.toMap())
          .then((value) {
        Utilis.toatsMessage('Uploaded Successfully');
      }).onError((error, stackTrace) {
        Utilis.toatsMessage('Something went wrong');

        channelID = '';
      });
    } catch (e) {
      Utilis.toatsMessage(e.toString());
    }
    return channelID;
  }

  Future<String> updateProfile(String userName, String gender, String bio,
      String phone, String location, String age, BuildContext context) async {
    String channelID = '';

    try {
      // var url = '';
      // if (file != null) {
      //   url = await storageMethods.uploadImageToSource(
      //       'profile', file, DateTime.now().millisecondsSinceEpoch.toString());
      // }
      final String channelId = DateTime.now().millisecondsSinceEpoch.toString();
      //final provider = Provider.of<UserProvide>(context, listen: false).user;
      channelID = channelId;
      _firestore
          .collection('profile')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': userName,
        'phone': phone,
        'location': location,
        'gender': gender,
        'bio': bio,
        'age': age
      }).then((value) {
        Utilis.toatsMessage('Uploaded Successfully');
      }).onError((error, stackTrace) {
        Utilis.toatsMessage('Something went wrong');

        channelID = '';
      });
    } catch (e) {
      Utilis.toatsMessage(e.toString());
    }
    return channelID;
  }

  Future<void> chat(String chatRoomId, String reciverId, String time,
      String name, String text, String id, BuildContext context) async {
    //final user = Provider.of<UserProvide>(context, listen: false);

    try {
      final String ansId = DateTime.now().millisecondsSinceEpoch.toString();
      await _firestore
          .collection('question')
          .doc(chatRoomId)
          .collection('answers')
          .doc(ansId)
          .set({
        'username': name,
        //'email': email,
        'message': text,
        'senderId': FirebaseAuth.instance.currentUser!.uid,
        'reciverId': reciverId,
        'createdAt': DateTime.now(),
        'answerId': ansId,
        'uid': chatRoomId
      });
    } on FirebaseException catch (e) {
      Utilis.toatsMessage(e.message!);
    }
  }

  Future<void> question(
      String receiverId, String name, String text, BuildContext context) async {
    final user = Provider.of<UserProvide>(context, listen: false);

    try {
      final String id = DateTime.now().millisecondsSinceEpoch.toString();
      await _firestore
          .collection('question')
          .doc(FirebaseAuth.instance.currentUser!.uid + receiverId)
          .collection('message')
          .doc(id)
          .set({
        'username': name,
        'email': FirebaseAuth.instance.currentUser!.email,
        'message': text,
        'uid': FirebaseAuth.instance.currentUser!.uid + receiverId,
        'createdAt': DateTime.now(),
        'messageId': id,
        'receiverId': receiverId,
        'senderId': FirebaseAuth.instance.currentUser!
      });
    } on FirebaseException catch (e) {
      Utilis.toatsMessage(e.message!);
    }
  }

  likeVideo(String id, BuildContext context) async {
    final user = Provider.of<UserProvide>(context, listen: false);
    DocumentSnapshot doc =
        await _firestore.collection('question').doc(id).get();
    var uid = user.user.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await _firestore.collection('question').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await _firestore.collection('question').doc(id).update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }
  }

  // updateSelection(String id, bool selected) async {
  //   try {
  //     await _firestore
  //         .collection('question')
  //         .doc(id)
  //         .update({'isSelected': selected});
  //   } catch (e) {
  //     Utilis.toatsMessage(e.toString());
  //   }
  // }

  // updateViewCount(String channelId, bool isIncreasing) async {
  //   try {
  //     await _firestore.collection('question').doc(channelId).update({
  //       'likes': FieldValue.increment(isIncreasing ? 1 : -1)
  //     }).onError((error, stackTrace) {
  //       Utilis.toatsMessage(error.toString());
  //     });
  //   } catch (e) {
  //     Utilis.toatsMessage(e.toString());
  //   }
  // }
}
