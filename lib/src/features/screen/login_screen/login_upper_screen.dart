import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/features/controller/log_in_controller/login_controller.dart';
import 'package:news_app/src/common_widjet/login_registration/login_registration_header.dart';
import 'package:news_app/src/features/controller/theme_controller/theme_controller.dart';
import 'package:news_app/src/features/screen/login_screen/login_form.dart';

// ignore: must_be_immutable
class LogInUpperScreen extends StatelessWidget {
   const LogInUpperScreen({
    super.key,
    required this.themeController,
    required this.height,
    required this.width,
    // ignore: non_constant_identifier_names
    required this.login_controller,
    
    // ignore: non_constant_identifier_names
  });

  final ThemeController themeController;
  final double height;
  final double width;
  // ignore: non_constant_identifier_names
  final LogInController login_controller;
  // ignore: non_constant_identifier_names


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: height / 5,
        // ),
        Obx(
          () => InkWell(
            onTap: () {
              themeController.toggleTheMode();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                      color: themeController.isDarkMode.value
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                            themeController.isDarkMode.value ? "Dark" : "Light",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                ),
              ),
            ),
          ),
        ),

        LoginRegistrationHeader(
          height: height,
          width: width,
          login_registration_text: 'SignIn',
        ),

        LogInForm(
            
            height: height,
            login_controller: login_controller,
            width: width,)
      ],
    );
  }
}


