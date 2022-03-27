import 'package:flutter/material.dart';
import 'package:flutter_chatting/controllers/contacts_controller.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/widgets/person_item.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ContactsPage extends StatelessWidget {
  final controller = Get.put(ContactsController());
  ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
      ),
      body: Obx(() {
        return LoadingOverlay(
          isLoading: controller.isLoading.value,
          color: Constants.textColor,
          progressIndicator: Center(
            child: LoadingAnimationWidget.inkDrop(color: Constants.primaryColor, size: 40,),
          ),
          child: ListView.builder(
            itemCount: controller.contacts.length,
            itemBuilder: (BuildContext context,int index) {
              return PersonItem(
                subtitle: controller.contacts[index].phones!.first.label!,
                name: controller.contacts[index].displayName!,
              );
            },
          ),
        );
      }),
    );
  }
}