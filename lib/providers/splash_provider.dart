import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting/screens/home/home.dart';
import 'package:flutter_chatting/screens/login/login.dart';

class SplashProvider extends ChangeNotifier {
  void onInit(BuildContext context) async {
    try {
      print('HAHAHAHAHAH');
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print('User found');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const Home();
            },
          ),
          (route) => false,
        );
      } else {
        print('User not found');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Login();
            },
          ),
          (route) => false,
        );
      }
      // await Future.delayed(
      //   const Duration(
      //     seconds: 5,
      //   ),
      //   () {
      //
      //   },
      // );
    } on Exception catch (e) {
      log('Meri marzi: $e');
    }
  }
}
