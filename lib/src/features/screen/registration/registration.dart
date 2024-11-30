import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/common_widjet/login_registration/login_registration_footer.dart';
import 'package:news_app/src/common_widjet/login_registration/login_registration_header.dart';
import 'package:news_app/src/common_widjet/login_registration/lonin_registration_button.dart';
import 'package:news_app/src/features/controller/log_in_controller/login_controller.dart';
import 'package:news_app/src/features/controller/registration_controller/registration_controller.dart';
import 'package:news_app/src/features/screen/login_screen/login.dart';
import 'package:news_app/src/features/screen/registration/registration_form.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    final RegistrationController registrationController =
        Get.put(RegistrationController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Center(
                  child: LoginRegistrationHeader(
                      height: height,
                      width: width,
                      login_registration_text: "SignUp"),
                ),
                SizedBox(
                  height: height / 20,
                ),
                RegistrationForm(
                    registrationController: registrationController),
                LogInRegistrationButton(
                  ontap: () {
                    if (

                        //login_controller!.formkey.currentState!.validate()&&
                        registrationController
                            .r_registration_formkey.currentState!
                            .validate()) {
                      Get.snackbar("Success!", "Successfully Registration");
                      // ignore: avoid_print
                      print(
                          "==================================Registration Done====================");

                      Get.off(() => const LogIn());
                    } else {
                      Get.snackbar("Failed!", "Please fillup the form");
                      // ignore: avoid_print
                      print(
                          "==================================Registration failed====================");
                    }
                    // ignore: avoid_print
                  },

                  registrationController: registrationController,
                  height: height,
                  width: width,
                  login_registration_text: "SignUp",
                  // formkey: registrationController.registration_formkey,
                ),
                LogInRegistrationFooter(
                  onPressedsignupSigninText: () {
                    Get.off(() => const LogIn());
                    Get.delete<LogInController>();
                    //  Get.delete<RegistrationController>();
                  },
                  width: width,
                  haveAccountText: "Have any account?",
                  signupSigninText: "SignIn",
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
