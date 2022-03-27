import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? hideText;
  final String? Function(String?) validator;
  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.hideText, required this.validator, this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 5,
        right: 5,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: hideText == null ? false : hideText!,
        validator: validator,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Constants.componentRadius,
            ),
            borderSide: BorderSide(
              color: Constants.primaryColor,
            ),
          ),
          enabled: true,
          label: Center(
            child: Text(
              label,
              style: TextStyle(
                color: Constants.primaryColor,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Constants.componentRadius,
            ),
            borderSide: BorderSide(
              color: Constants.primaryColor,
            ),
          ),
          filled: true,
          fillColor: Constants.primaryColor.withOpacity(0.2),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Constants.componentRadius,
            ),
            borderSide: BorderSide(
              color: Constants.tertiaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
