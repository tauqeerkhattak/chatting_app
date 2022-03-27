import 'package:flutter/material.dart';
import 'package:flutter_chatting/controllers/splash_controller.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/data/size_config.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  final controller = Get.put(SplashController());
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Constants.primaryColor,
          ),
        ),
      ),
    );
  }
}