import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 5,
        right: 5,
      ),
      width: double.maxFinite,
      child: ElevatedButton(
        child: Text(
          buttonText.toUpperCase(),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Constants.primaryColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Constants.componentRadius,
              ),
            ),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
