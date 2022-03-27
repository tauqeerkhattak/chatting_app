import 'package:flutter/cupertino.dart';

class SizeConfig {
  static MediaQueryData? mediaQuery;
  static double? screenWidth;
  static double? screenHeight;

  void init (BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery!.size.width;
    screenHeight = mediaQuery!.size.height;
  }
}