import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  final String uid;
  final String userName;
  final String profilePic;
  final String country;
  final String phone;
  final String gender;
  final String location;
  final List<dynamic> images;
  final List<dynamic> interests;
  final String jobTitle;
  final String bio;
  final String age;

  Profile(
      {required this.uid,
      required this.userName,
      required this.age,
      required this.profilePic,
      required this.jobTitle,
      required this.images,
      required this.interests,
      required this.phone,
      required this.location,
      required this.gender,
      required this.bio,
      required this.country});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': userName,
      'profilePic': profilePic,
      'jobTitle': jobTitle,
      'images': images,
      'interests': interests,
      'phone': phone,
      'location': location,
      'gender': gender,
      'country': country,
      'bio': bio,
      'age': age
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      uid: map['uid'] ?? '',
      userName: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      jobTitle: map['jobTitle'] ?? '',
      images: map['images'] ?? '',
      interests: map['interests'] ?? '',
      phone: map['phone'] ?? '',
      location: map['location'] ?? '',
      gender: map['gender'] ?? '',
      country: map['country'] ?? '',
      bio: map['bio'] ?? '',
      age: map['age'] ?? '',
    );
  }

  static Profile fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Profile(
      userName: snapshot['name'],
      uid: snapshot['uid'],
      profilePic: snapshot['profilePic'],
      jobTitle: snapshot['jobTitle'],
      images: snapshot['images'],
      interests: snapshot['interests'],
      phone: snapshot['phone'],
      location: snapshot['location'],
      gender: snapshot['gender'],
      country: snapshot['country'],
      bio: snapshot['bio'],
      age: snapshot['age'],
    );
  }
}
