import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chatting/screens/login/login.dart';
import 'package:flutter_chatting/services/firebase_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  User? user = FirebaseService.getCurrentUser();

  void logout() async {
    await FirebaseService.logout().then((value) {
      Get.offAll(() => Login());
    });
  }
}