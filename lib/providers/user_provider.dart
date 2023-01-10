import 'package:flutter/cupertino.dart';
import 'package:kencan/models/user.dart';

class UserProvide extends ChangeNotifier {
  User _user = User(uid: '', username: '', email: '');

  User get user => _user;
  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
