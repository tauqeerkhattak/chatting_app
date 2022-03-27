import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_chatting/controllers/login_controller.dart';
import 'package:flutter_chatting/data/constants.dart';
import 'package:flutter_chatting/data/size_config.dart';
import 'package:flutter_chatting/screens/register/register.dart';
import 'package:flutter_chatting/widgets/custom_button.dart';
import 'package:flutter_chatting/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_overlay/loading_overlay.dart';

class Login extends StatelessWidget {
  final controller = Get.put(LoginController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return LoadingOverlay(
          isLoading: controller.isLoading.value,
          color: Constants.textColor,
          progressIndicator: Center(
            child: LoadingAnimationWidget.inkDrop(color: Constants.primaryColor, size: 40,),
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
                height: SizeConfig.screenHeight! * 0.52,
                width: SizeConfig.screenWidth! * 0.8,
                decoration: BoxDecoration(
                  color: Constants.textColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Constants.componentRadius,
                    ),
                    bottomRight: Radius.circular(
                      Constants.componentRadius,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        'Welcome!'.toUpperCase(),
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      label: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return 'Please enter an email';
                        }
                        else if (!text.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        else if (!text.contains('.com')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      label: 'Password',
                      hideText: true,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return 'Please enter an password';
                        }
                        else if (text.length < 8) {
                          return 'Password must contain at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    CustomButton(
                      buttonText: 'Login',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text;
                          String password = passwordController.text;
                          controller.login(email, password);
                        }
                      },
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => Register(),);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Register',
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
