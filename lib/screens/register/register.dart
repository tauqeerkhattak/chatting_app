import 'package:flutter/material.dart';
import 'package:flutter_chatting/controllers/register_controller.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/data/size_config.dart';
import 'package:flutter_chatting/widgets/custom_button.dart';
import 'package:flutter_chatting/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';

class Register extends StatelessWidget {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = Get.put(RegisterController());
  final formKey = GlobalKey<FormState>();
  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: controller.isLoading.value,
        color: Constants.textColor,
        progressIndicator: Center(
          child: LoadingAnimationWidget.inkDrop(color: Constants.primaryColor,size: 40),
        ),
        child: Form(
          key: formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Constants.primaryColor,
                  Constants.secondaryColor,
                  Constants.tertiaryColor,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [
                  0,
                  0.5,
                  1,
                ],
              ),
            ),
            alignment: Alignment.center,
            child: Container(
              height: SizeConfig.screenHeight! * 0.7,
              width: SizeConfig.screenWidth! * 0.8,
              decoration: BoxDecoration(
                color: Constants.textColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    Constants.componentRadius,
                  ),
                  bottomLeft: Radius.circular(
                    Constants.componentRadius,
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      'Register'.toUpperCase(),
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomTextField(
                    label: 'Username',
                    controller: usernameController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: 'Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Please enter an email';
                      } else if (!text.contains('@')) {
                        return 'Please enter a valid email';
                      } else if (!text.contains('.com')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: 'Phone',
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Please enter an phone number';
                      } else if (text.length < 11) {
                        return 'Please enter a valid phone number';
                      }
                      else if (text.contains('+') && text.length != 13) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: 'Password',
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hideText: true,
                    validator: (String? text) {
                      if (text!.isEmpty) {
                        return 'Please enter a password';
                      } else if (text.length < 8) {
                        return 'Password must contains at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                    buttonText: 'Register',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        String email = emailController.text;
                        String username = usernameController.text;
                        String password = passwordController.text;
                        String phone = phoneController.text;
                        controller.registerUser(email, username, password, phone);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
