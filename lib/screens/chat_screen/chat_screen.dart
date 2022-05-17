import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/data/size_config.dart';
import 'package:flutter_chatting/providers/chat_provider.dart';
import 'package:flutter_chatting/widgets/chat_bubble.dart';
import 'package:flutter_chatting/widgets/custom_textfield.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final String name;

  const ChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatProvider>(
      create: (context) {
        return ChatProvider().onInit();
      },
      child: Scaffold(
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
        body: Column(
          children: [
            Expanded(
              child: Consumer<ChatProvider>(
                builder: (context, data, child) {
                  return ListView.builder(
                    reverse: true,
                    controller: data.scrollController,
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatBubble(
                        text: data.dummyText[index % data.dummyText.length],
                        isCurrentUser: index % 2 == 0,
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<ChatProvider>(
              builder: (context, data, child) {
                return Column(
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
                        controller: data.messageController,
                        label: 'Message',
                        filled: false,
                        keyboardType: TextInputType.text,
                        prefix: IconButton(
                          icon: Icon(
                            Icons.emoji_emotions,
                            color: Constants.primaryColor,
                          ),
                          onPressed: () {
                            data.toggle(context);
                          },
                        ),
                        onTap: () {
                          print('Textfield tapped!');
                          data.showEmojis = false;
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
                        print(
                            'Keyboard open: ${config.isKeyboardOpen} showEmojis: ${data.showEmojis}');
                        if (config.isKeyboardOpen) {
                          if (data.showEmojis) {
                            return showEmojiPicker(data);
                          } else {
                            return const SizedBox();
                          }
                        } else {
                          if (data.showEmojis) {
                            return showEmojiPicker(data);
                          } else {
                            return const SizedBox();
                          }
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget showEmojiPicker(ChatProvider pod) {
    print('ShowEmojiPicker ${pod.keyboardHeight}');
    return Container(
      width: SizeConfig.screenWidth,
      height: pod.keyboardHeight,
      color: Constants.primaryColor,
      // child: EmojiPicker(
      //   onEmojiSelected: (category, emoji) {
      //     pod.messageController.text += emoji.emoji;
      //   },
      //   onBackspacePressed: () {
      //     pod.messageController
      //       ..text =
      //           pod.messageController.text.characters.skipLast(1).toString()
      //       ..selection = TextSelection.fromPosition(
      //         TextPosition(
      //           offset: pod.messageController.text.length,
      //         ),
      //       );
      //   },
      //   config: Config(
      //     buttonMode: ButtonMode.MATERIAL,
      //     indicatorColor: Constants.primaryColor,
      //     iconColorSelected: Constants.primaryColor,
      //     backspaceColor: Constants.primaryColor,
      //   ),
      // ),
    );
  }
}
