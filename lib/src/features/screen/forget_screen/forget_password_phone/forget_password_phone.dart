import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/features/controller/forget_controller/email_phone_validation.dart';
import 'package:news_app/src/common_widjet/login_registration/forget/forget_password_mail_phone.dart';
import 'package:news_app/src/features/screen/forget_screen/forget_password_otp/forget_otp.dart';

class ForgetPasswordPhone extends StatelessWidget {
  const ForgetPasswordPhone({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController controllerforgetPasswordPhone =
    //     TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    EmailPhoneValidationController emailPhoneValidation =
        Get.put(EmailPhoneValidationController());
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ForgetPasswordMailPhone(
          errorColor: Colors.red,
          keyboardType: TextInputType.phone,
          formkeyForgetPassword:
              emailPhoneValidation.formkeyForgetPasswordphone,
          height: height,
          width: width,
          lebelText: "Phone",
          hintText: "Enter a Phone Number",
          controller: emailPhoneValidation.controllerforgetPasswordPhone,
          validator: emailPhoneValidation.validPhoneNumber,
          ontap: () {
            if (emailPhoneValidation.formkeyForgetPasswordphone.currentState!
                .validate()) {
              Get.snackbar("success", "SuccessFully Done!");
              Get.off(() => const ForgetOtp());
              emailPhoneValidation.controllerforgetPasswordMail.clear();
            } else {
              Get.snackbar("Failed", "Faild it inert valid phone number!");
            }
          },
        ),
      ),
    ));
  }
}
