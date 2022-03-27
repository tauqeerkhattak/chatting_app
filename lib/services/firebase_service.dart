import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chatting/models/user_model.dart';
import 'package:flutter_chatting/screens/login/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../screens/home/home.dart';

class FirebaseService {

  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Registers a new user in Firebase Authentication
  static Future<void> register ({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      _firestore.collection('Users').doc(email).set({
        'username': username,
        'email': email,
        'phone': phone,
      }).then((value) {
        Get.offAll(() => Home(),);
        Fluttertoast.showToast(msg: 'User created successfully');
      });
    });
  }

  //Logins in user, must reset the current flow of the app to Home
  static Future <void> login (String email,String password) async {
    auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      Fluttertoast.showToast(msg: 'User logged in');
      Get.offAll(() => Home(),);
    }).catchError((error) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  //Logs the current user out, must reset the current flow of the app to Login
  static Future <void> logout () async {
    await auth.signOut().then((value) {
      Get.offAll(() => Login(),);
    }).catchError((onError) {
      Fluttertoast.showToast(msg: onError.toString());
    });
  }

  //Returns current user
  static User? getCurrentUser () {
    return auth.currentUser;
  }
  
  static Future<List <UserModel>> getAllUsers () async {
    List <UserModel> users = [];
    await _firestore.collection('Users').get().then((value) {
      for (var element in value.docs) {
        users.add(UserModel.fromJson(element.data()));
      }
    });
    return users;
  }
}
