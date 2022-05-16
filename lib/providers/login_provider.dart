import 'package:flutter/material.dart';
import 'package:flutter_chatting/services/firebase_service.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  void login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      FirebaseService.login(email, password);
    });
    isLoading = false;
    notifyListeners();
  }
}
