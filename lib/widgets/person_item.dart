import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/data/size_config.dart';
import 'package:flutter_chatting/screens/chat_screen/chat_screen.dart';
import 'package:get/get.dart';

class PersonItem extends StatelessWidget {
  final String name;
  final String subtitle;
  const PersonItem({Key? key,required this.name,required this.subtitle,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ChatScreen(name: name,),);
      },
      child: Container(
        height: SizeConfig.screenHeight! * 0.1,
        margin: const EdgeInsets.only(
          top: 5,
          left: 5,
          right: 5,
          bottom: 5,
        ),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0,),
                child: Icon(
                  Icons.person,
                  color: Constants.textColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5,bottom: 2,),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ),
                Container(
                    margin: const EdgeInsets.only(left: 5,),
                    child:  Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}