import 'package:flutter/material.dart';
import 'package:news_app/src/common_widjet/login_registration/login_registration_header.dart';
import 'package:news_app/src/common_widjet/login_registration/lonin_registration_button.dart';

class ForgetPasswordMailPhone extends StatelessWidget {
  const ForgetPasswordMailPhone(  {
    super.key,
    required this.height,
    required this.width,
    required this.lebelText,
    required this.hintText,
    required this.controller,
    required this.ontap,
     this.validator,
    this.formkeyForgetPassword,
    required this.keyboardType,
    this.errorColor,
    //  required this.emailPhoneValidation,
  });

  final double height;
  final double width;
  final TextInputType keyboardType;
  final String lebelText;
  final String hintText;
  final TextEditingController controller;
  final VoidCallback ontap;
final FormFieldValidator<String>? validator;
  final GlobalKey<FormState>? formkeyForgetPassword;
  final Color? errorColor;
  // final EmailPhoneValidation emailPhoneValidation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height * .5,
        child: Column(
          children: [
            LoginRegistrationHeader(
                height: height,
                width: width,
                login_registration_text: "Forget Password"),
            Form(
              key: formkeyForgetPassword,
              child: TextFormField(
                controller: controller,
                //  obscureText: obscureText,
                // keyboardType: keyboardType,
                validator: validator,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(19),
                    labelStyle: TextStyle(
                        fontSize: 20,
                        foreground: Paint(),
                        fontWeight: FontWeight.bold),
                    hintStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: hintText,
                    //    suffixIcon: suffixIcon,
                    labelText: lebelText,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    errorStyle: TextStyle(color: errorColor, fontSize: 14)),
              ),
            ),
            LogInRegistrationButton(
                height: height,
                width: width,
                login_registration_text: "Submit",
                ontap: ontap)
          ],
        ),
      ),
    );
  }
}
