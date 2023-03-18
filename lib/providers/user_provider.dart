import 'package:flutter/material.dart';
import 'package:querium/models/user.dart';
import 'package:querium/resources/auth_methods.dart';

//This class is used as the singleton class for the user
//It provides the user object
class UserProvider with ChangeNotifier {
  User? _user;

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await AuthMethods().getUserDetails();
    _user = user;
    notifyListeners();
  }
}
