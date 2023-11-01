import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void loginUser(String email, String password) {
    _user = User(email: email, password: password);
    notifyListeners();
  }

  void logoutUser() {
    _user = null;
    notifyListeners();
  }
}