import 'package:flutter_chatting/services/firebase_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  void login (String email,String password) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2,),() {
      FirebaseService.login(email, password);
    });
    isLoading.value = false;
  }
}