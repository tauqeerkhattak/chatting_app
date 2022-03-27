import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/data/size_config.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isCurrentUser;

  const ChatBubble({Key? key,required this.text,required this.isCurrentUser,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          !isCurrentUser ? const SizedBox(width: 5,) : const SizedBox(),
          !isCurrentUser ? DecoratedBox(
            decoration: BoxDecoration(
              color: Constants.tertiaryColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0,),
              child: Icon(
                Icons.person,
                color: Constants.textColor,
              ),
            ),
          ) : const SizedBox(),
          !isCurrentUser ? const SizedBox(width: 5,) : const SizedBox(),
          Container(
            width: SizeConfig.screenWidth! * 0.7,
            margin: const EdgeInsets.only(
              top: 3,
              bottom: 3,
            ),
            decoration: BoxDecoration(
              color: isCurrentUser ? Constants.primaryColor : Constants.tertiaryColor,
              borderRadius: BorderRadius.circular(20,),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12,),
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Constants.textColor,
                ),
              ),
            ),
          ),
          !isCurrentUser ? const SizedBox() : const SizedBox(width: 5,),
        ],
      ),
    );
  }
}