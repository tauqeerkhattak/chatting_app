import 'package:flutter/material.dart';
import 'package:flutter_chatting/data/constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? hideText, filled;
  final String? Function(String?) validator;
  final Widget? prefix;
  final Widget? suffix;
  final Function()? onTap;
  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.hideText,
    required this.validator,
    this.keyboardType,
    this.prefix,
    this.filled,
    this.suffix,
    this.onTap,
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
        onTap: onTap,
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
          prefixIcon: prefix,
          suffixIcon: suffix,
          enabled: true,
          label: filled ?? true
              ? Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Constants.tertiaryColor,
                    ),
                  ),
                )
              : Text(
                  label,
                  style: TextStyle(
                    color: Constants.tertiaryColor,
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
          filled: filled ?? true,
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
