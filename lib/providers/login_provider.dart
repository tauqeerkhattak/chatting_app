import 'package:flutter/material.dart';
import 'package:flutter_chatting/services/firebase_service.dart';
import 'package:get/get.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void login(String email, String password,BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      FirebaseService.login(email, password,context);
    });
    isLoading = false;
    notifyListeners();
  }
}
