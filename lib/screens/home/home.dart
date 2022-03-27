import 'package:flutter/material.dart';
import 'package:flutter_chatting/controllers/home_controller.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/screens/contacts_page/contacts_page.dart';
import 'package:flutter_chatting/services/firebase_service.dart';
import 'package:flutter_chatting/widgets/chat_bubble.dart';
import 'package:flutter_chatting/widgets/custom_button.dart';
import 'package:flutter_chatting/widgets/person_item.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final controller = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.primaryColor,
        onPressed: () {
          Get.to(() => ContactsPage(),);
        },
        child: Icon(
          Icons.person_add_alt_1,
          color: Constants.textColor,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const Text(
          'Home',
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseService.logout();
            },
            icon: Icon(
              Icons.logout,
              color: Constants.textColor,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (BuildContext context,int index) {
          return PersonItem(name: 'Item # $index',subtitle: 'jj',);
        },
        separatorBuilder: (BuildContext context,int index) {
          return Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Divider(
              color: Constants.primaryColor,
              height: 0.0,
            ),
          );
        },
      ),
    );
  }
}
