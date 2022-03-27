import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chatting/screens/home/home.dart';
import 'package:flutter_chatting/screens/login/login.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
    ).then((value) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offAll(() => Home(),);
      } else {
        Get.offAll(
          () => Login(),
        );
      }
    });
    super.onInit();
  }
}
