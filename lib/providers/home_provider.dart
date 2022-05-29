import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting/screens/login/login.dart';
import 'package:flutter_chatting/services/firebase_service.dart';

class HomeProvider extends ChangeNotifier {
  User? user = FirebaseService.getCurrentUser();

  void logout(BuildContext context) async {
    log('Logout');
    await FirebaseService.logout(context).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return Login();
        },),
        (route) => false,
      );
    });
  }
}
