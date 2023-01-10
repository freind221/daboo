import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kencan/Utilis/utilis.dart';
import 'package:kencan/models/profile_model.dart';
import 'package:kencan/presentation/home.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:kencan/models/user.dart' as model;

import '../presentation/light_select_country_blank_screen/light_select_country_blank_screen.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  Future<Map<String, dynamic>?> getCurrentUser(String? uid) async {
    if (uid != null) {
      final snap = await _firestore.doc(uid).get();
      // Here we are gonna get the data from user that we stored in snap variable

      return snap.data();
    }
    return null;
  }

  setToProvider(BuildContext context) async {
    Provider.of<UserProvide>(context, listen: false).setUser(
        model.User.fromMap(await getCurrentUser(_auth.currentUser!.uid) ?? {}));
  }

  User get user => _auth.currentUser!;

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(credentials);
      User? Myuser = userCredential.user;

      if (Myuser != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          model.User user = model.User(
              uid: Myuser.uid,
              username: Myuser.displayName!,
              email: Myuser.email!);
          Provider.of<UserProvide>(context, listen: false).setUser(user);
          _firestore
              .collection('users')
              .doc(user.uid)
              .set(user.toMap())
              .then((value) {
            Utilis.toatsMessage('User got logged in');
          }).then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LightSelectCountryBlankScreen()),
            );
          }).onError((error, stackTrace) {
            Utilis.toatsMessage(error.toString());
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      Utilis.toatsMessage(e.toString());
      res = false;
    }
    return res;
  }

  Future<bool> signupUser(
      String email, String password, BuildContext context) async {
    bool res = false;
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (_auth.currentUser != null) {
        res = true;
        model.User user = model.User(
            uid: _auth.currentUser!.uid, username: '', email: email.trim());
        Provider.of<UserProvide>(context, listen: false).setUser(user);
        _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .set(user.toMap())
            .then((value) {
          Utilis.toatsMessage("Saved");
        }).onError((error, stackTrace) {
          Utilis.toatsMessage(error.toString());
        });
      }
    }).onError((error, stackTrace) {
      res = false;
      Utilis.toatsMessage(error.toString());
    });
    return res;
  }

  Future<bool> loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    bool res = false;
    try {
      // Here in this line we got users credetials by which we can get user data easily
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        if (_auth.currentUser != null) {
          // Provider.of<UserProvide>(context, listen: false).setUser(
          //     model.User.fromMap(
          //         await getCurrentUser(_auth.currentUser!.uid) ?? {}));
          setToProvider(context);

          Utilis.toatsMessage('Logged in');
          res = true;
        }
      }
    } catch (e) {
      Utilis.toatsMessage(e.toString());
      res = false;
    }
    return res;
  }

  Future logout() async {
    await _auth.signOut();
  }
}
