import 'package:flutter/material.dart';
import 'package:flutter_chatting/controllers/chat_controller.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/widgets/chat_bubble.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final controller = Get.put(ChatController());
  final String name;
  final List <String> dummyText = [
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
    'Aliquam tincidunt mauris eu risus.',
    'Vestibulum auctor dapibus neque.',
    'Nunc dignissim risus id metus.',
    'Cras ornare tristique elit.',
    'Vivamus vestibulum ntulla nec ante.',
    'Praesent placerat risus quis eros.',
    'Fusce pellentesque suscipit nibh.',
    'Integer vitae libero ac risus egestas placerat.',
  ];

  ChatScreen({Key? key,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            color: Constants.textColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
      ),
      body: ListView.builder(
        itemCount: dummyText.length,
        itemBuilder: (BuildContext context,int index) {
          return ChatBubble(text: dummyText[index], isCurrentUser: index % 2 == 0);
        },
      ),
    );
  }
}