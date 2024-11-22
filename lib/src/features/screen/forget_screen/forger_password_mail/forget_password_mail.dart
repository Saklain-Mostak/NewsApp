// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/features/controller/forget_controller/email_phone_validation.dart';
import 'package:news_app/src/common_widjet/login_registration/forget/forget_password_mail_phone.dart';
import 'package:news_app/src/features/screen/forget_screen/forget_password_otp/forget_otp.dart';

class ForgetPasswordMail extends StatelessWidget {
  const ForgetPasswordMail({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    EmailPhoneValidationController emailPhoneValidation = Get.put(EmailPhoneValidationController());

    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ForgetPasswordMailPhone(
          keyboardType: TextInputType.text,
          errorColor: Colors.red,
        
          formkeyForgetPassword: emailPhoneValidation.formkeyForgetPasswordmail,
          height: height,
          width: width,
          lebelText: 'Email',
          hintText: 'Enter a Mail',
          controller: emailPhoneValidation.controllerforgetPasswordMail,
          validator: emailPhoneValidation.validemail1,
          ontap: () {
          
           
            print(
                "++++++++++++++++++++++++++++++++${emailPhoneValidation.controllerforgetPasswordMail.text}");
        
            print("========================Submit==========");
        
            if (emailPhoneValidation.formkeyForgetPasswordmail.currentState!
                .validate()) {
              Get.snackbar("Success", "Successfully Done!");
              Get.off(()=>const ForgetOtp());
              emailPhoneValidation.controllerforgetPasswordMail.clear();
            } else {
              Get.snackbar("Failed", "Failed it!");
            }
            

            
          },
        
        // ontap: () {
        //   bool isValid = emailPhoneValidation.formkeyForgetPasswordmail.currentState?.validate() ?? false;
        //   print("Is valid: $isValid");
        
        //   if (isValid) {
        //     Get.snackbar("Success", "Successfully Done!");
        //   } else {
        //     Get.snackbar("Failed", "Failed it!");
        //   }
        // },
        ),
      ),
    )));
  }
}
