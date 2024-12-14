// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/common_widjet/login_registration/custom_text_form_field.dart';
import 'package:news_app/src/common_widjet/login_registration/lonin_registration_button.dart';
import 'package:news_app/src/features/controller/log_in_controller/login_controller.dart';
import 'package:news_app/src/features/screen/screen1/home_screen/home_screen1.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,

    required this.height,
    required this.login_controller,
    required this.width,
  });


  final double height;
  final LogInController login_controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: login_controller.l_login_formkey,

        //login_controller.LogInFormkey,
        child: Column(
          children: [
            SizedBox(
              height: height / 65,
            ),
            Customtextformfield(
              errorColor: const Color.fromARGB(255, 226, 7, 7),
              validator: login_controller.validemail,
              labelText: "Email",
              hintText: "Ënter a Email",
              controller: login_controller.login_email_controller,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            SizedBox(
              height: height / 150,
            ),
            Obx(() {
              return Customtextformfield(
                  errorColor: const Color.fromARGB(255, 231, 7, 7),
                  validator: login_controller.validpassword,
                  labelText: "Password",
                  hintText: "Ënter a Password",
                  controller: login_controller.login_password_controller,
                  obscureText: login_controller.obscureText.value,
                  keyboardType: TextInputType.text,
                  suffixIcon: IconButton(
                      onPressed: () {
                        login_controller.obscureText.value =
                            !login_controller.obscureText.value;
                      },

                      // ignore: unrelated_type_equality_checks
                      icon: login_controller.obscureText.value
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)));
            }),
            LogInRegistrationButton(
              ontap: () {
                if (

                    //login_controller!.formkey.currentState!.validate()&&
                    login_controller.l_login_formkey.currentState!.validate()) {
                  Get.snackbar("Success!", "Successfully LogIn");
                  // ignore: avoid_print
                  print(
                      "==================================LogIn Done====================");

                  Get.off(() => const HomeScreen());
                } else {
                  Get.snackbar("Failed!", "Please fillup the form");
                  // ignore: avoid_print
                  print(
                      "==================================LogIn failed====================");
                }
                // ignore: avoid_print
              },
              login_controller: login_controller,
              height: height,
              width: width,
              login_registration_text: 'Sign In',
            )
          ],
        )
        );
  }
}