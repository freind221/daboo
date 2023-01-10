import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:kencan/models/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  Profile _profile = Profile(
      uid: '',
      userName: '',
      profilePic: '',
      jobTitle: '',
      images: [],
      interests: [],
      phone: '',
      location: '',
      gender: '',
      bio: '',
      age: '',
      country: '');

  String _name = '';
  String _age = '';
  String _job = '';
  String? _pic;
  String _bio = '';
  String _phone = '';
  String _loc = '';
  String _country = '';
  String _gender = '';
  List<dynamic> _images = [];
  List<dynamic> _interests = [];
  List<Profile> models = [];
  setList(List<Profile> list) {
    models = list;
    notifyListeners();
  }

  setName(String name) {
    _name = name;
    notifyListeners();
  }

  setAge(String age) {
    _age = age;
    notifyListeners();
  }

  setPic(String pic) {
    _pic = pic;
    notifyListeners();
  }

  setJob(String jon) {
    _job = jon;
    notifyListeners();
  }

  setLocation(String loc) {
    _loc = loc;
    notifyListeners();
  }

  setCountry(String country) {
    _country = country;
    notifyListeners();
  }

  setBio(String bio) {
    _bio = bio;
    notifyListeners();
  }

  setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  setInterests(List<dynamic> interests) {
    _interests = interests;
    notifyListeners();
  }

  setImages(List<dynamic> images) {
    _images = images;
    notifyListeners();
  }

  setPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  setUser(Profile user) {
    _profile = user;
    notifyListeners();
  }

  Profile get user => _profile;
  String get userName => _name;
  String get profilePic => _pic!;
  String get bio => _bio;
  String get gender => _gender;
  String get country => _country;
  String get job => _job;
  String get age => _age;
  String get location => _loc;
  String get phone => _phone;
  List<dynamic> get interests => _interests;
  List<dynamic> get images => _images;
}
