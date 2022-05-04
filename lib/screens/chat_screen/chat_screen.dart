import 'dart:developer';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting/controllers/chat_controller.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/data/size_config.dart';
import 'package:flutter_chatting/widgets/chat_bubble.dart';
import 'package:flutter_chatting/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';

class ChatScreen extends StatelessWidget {
  final controller = Get.put(ChatController());
  final String name;

  ChatScreen({Key? key, required this.name}) : super(key: key);

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
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight!,
                child: ListView.builder(
                  reverse: true,
                  controller: controller.scrollController,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatBubble(
                      text: controller
                          .dummyText[index % controller.dummyText.length],
                      isCurrentUser: index % 2 == 0,
                    );
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.1,
                width: SizeConfig.screenWidth,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  width: SizeConfig.screenWidth,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 10,
                  ),
                  color: Constants.textColor,
                  height: SizeConfig.screenHeight! * 0.1,
                  child: CustomTextField(
                    controller: controller.messageController,
                    label: 'Message',
                    filled: false,
                    keyboardType: TextInputType.text,
                    prefix: IconButton(
                      icon: Icon(
                        Icons.emoji_emotions,
                        color: Constants.primaryColor,
                      ),
                      onPressed: () {
                        log('emoji');
                        controller.showEmojis.toggle();
                        FocusScope.of(context).unfocus();
                        log('${controller.showEmojis.value} Hey');
                      },
                    ),
                    onTap: () {
                      controller.showEmojis.value = false;
                    },
                    suffix: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Constants.primaryColor,
                      ),
                      onPressed: () {
                        log('send');
                      },
                    ),
                    validator: (String? message) {
                      if (message == null) {
                        return 'Type a message';
                      }
                      return null;
                    },
                  ),
                ),
                KeyboardAware(
                  builder: (context, config) {
                    if (config.isKeyboardOpen) {
                      if (controller.showEmojis.value) {
                        return showEmojiPicker();
                      } else {
                        return const SizedBox();
                      }
                    } else {
                      if (controller.showEmojis.value) {
                        return showEmojiPicker();
                      } else {
                        return const SizedBox();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showEmojiPicker() {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: controller.keyboardHeight.value,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          controller.messageController.text += emoji.emoji;
        },
        onBackspacePressed: () {
          controller.messageController
            ..text = controller.messageController.text.characters
                .skipLast(1)
                .toString()
            ..selection = TextSelection.fromPosition(
              TextPosition(
                offset: controller.messageController.text.length,
              ),
            );
        },
        config: Config(
          buttonMode: ButtonMode.MATERIAL,
          indicatorColor: Constants.primaryColor,
          iconColorSelected: Constants.primaryColor,
          backspaceColor: Constants.primaryColor,
        ),
      ),
    );
  }
}
