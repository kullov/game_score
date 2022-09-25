import 'package:flutter/material.dart';
import 'package:game_score/models/user.dart';

class UserNotifier with ChangeNotifier {
  List<User> _listUser = [];

  List<User> get listUser => _listUser;

  void setListUser(List<User> list) {
    _listUser = list;
    notifyListeners();
  }

  void addNewUser(User user) {
    _listUser.add(user);
    notifyListeners();
  }
}
