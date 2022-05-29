import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/data/size_config.dart';
import 'package:flutter_chatting/providers/splash_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      try {
        context.read<SplashProvider>().onInit(context);
      } on Exception catch (e) {
        log("MEra Error $e");
      }
      // context.read<SplashProvider>().onInit(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.inkDrop(
          color: Constants.primaryColor,
          size: 40,
        ),
      ),
    );
  }
}
