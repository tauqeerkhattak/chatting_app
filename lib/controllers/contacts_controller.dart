import 'dart:developer';

import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/models/user_model.dart';
import 'package:flutter_chatting/screens/home/home.dart';
import 'package:flutter_chatting/services/firebase_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsController extends GetxController {
  List <Contact> contacts = <Contact>[].obs;
  List <UserModel> persons = <UserModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    final status = await Permission.contacts.request();
    if (status.isGranted) {
      contacts = await ContactsService.getContacts(withThumbnails: false,);
      List temp = await FirebaseService.getAllUsers();
      User? currentUser = FirebaseService.getCurrentUser();
      // for (Contact element in contacts) {
      //   for (UserModel user in temp) {
      //     String phone = '';
      //     if (user.phone.contains('+')) {
      //       phone = user.phone.split('+92').last;
      //     }
      //     else {
      //       phone = user.phone.substring(1);
      //     }
      //     if (element.phones!.first.value!.contains(phone)) {
      //       if (!persons.contains(user)) {
      //         if (user.email != currentUser!.email) {
      //           persons.add(user);
      //         }
      //       }
      //     }
      //   }
      // }
      contacts.forEach((element) {
        log(element.displayName!);
      });
      isLoading.value = false;
    }
    else {
      Get.dialog(AlertDialog(
        title: Text(
          'Permission needed!',
          style: TextStyle(
            color: Constants.primaryColor,
          ),
        ),
        content: const Text('To use this app, you must provide contacts permission!'),
        actions: [
          TextButton(
            child: Text(
              'Okay',
              style: TextStyle(
                color: Constants.primaryColor,
              ),
            ),
            onPressed: () {
              Get.offAll(() => Home(),);
            },
          ),
        ],
      ),);
    }
    super.onInit();
  }
}