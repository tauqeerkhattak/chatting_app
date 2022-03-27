import 'package:flutter_chatting/services/firebase_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  void registerUser (String email,String username,String password,String phone) {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2,),() {
      FirebaseService.register(username: username, email: email, phone: phone, password: password,);
    });
    isLoading.value = false;
  }
}