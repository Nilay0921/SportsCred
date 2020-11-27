import 'dart:async';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var loggedInUser;

  Future getUser() {
    return Future.value(loggedInUser);
  }

  Future logout() {
    this.loggedInUser = null;
    notifyListeners();
    return Future.value(loggedInUser);
  }

  Future createUser({
    String firstName,
    String lastName,
    String email,
    String password
  }) async {}

  Future loginUser({String email, String password}) {
    if (password == 'password123') {
      this.loggedInUser = {'email': email};
      notifyListeners();
      return Future.value(loggedInUser);
    } else {
      this.loggedInUser = null;
      return Future.value(null);
    }
  }
}