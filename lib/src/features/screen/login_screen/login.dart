// ignore_for_file: non_constant_identifier_names
// ignore: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/features/controller/log_in_controller/login_controller.dart';
import 'package:news_app/src/common_widjet/login_registration/login_registration_footer.dart';
import 'package:news_app/src/features/controller/theme_controller/theme_controller.dart';
import 'package:news_app/src/features/screen/forget_screen/forget_password_option/forget_password_option.dart';
import 'package:news_app/src/features/screen/login_screen/login_upper_screen.dart';
import 'package:news_app/src/features/screen/registration/registration.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final LogInController login_controller = Get.put(LogInController());
    final ThemeController themeController = Get.put(ThemeController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                LogInUpperScreen(
                  themeController: themeController,
                  height: height,
                  width: width,
                  login_controller: login_controller,
                ),
                LogInRegistrationFooter(
                  onPressedsignupSigninText: () {
                    Get.off(() => const Registration());
                    //  Get.delete<LogInController>();
                    //  Get.delete<RegistrationController>();
                  },
                  width: width,
                  signupSigninText: "SignUp",
                  haveAccountText: "Don't have an account?",
                  textButtonWidgetforgetPassword: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (_) =>
                                const ForgetBottomSheetVerification());
                      },
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

