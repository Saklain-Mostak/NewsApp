// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news_app/src/common_widjet/login_registration/custom_text_form_field.dart';
import 'package:news_app/src/features/controller/registration_controller/registration_controller.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({
    super.key,
  
    required this.registrationController,
  });


  final RegistrationController registrationController;

  @override
  Widget build(BuildContext context) {
    return Form(
        key:registrationController.r_registration_formkey,
        // registrationController.registration_formkey,
        child: Column(
          children: [
            Customtextformfield(
                errorColor: Colors.red,
                validator: registrationController.validName,
                labelText: "Name",
                hintText: "Enter Your Name",
                controller: registrationController.r_namecontroller,
                keyboardType: TextInputType.text),
            Customtextformfield(
                errorColor: Colors.red,
                validator: registrationController.validemail,
                labelText: "Email",
                hintText: "Enter Your Email",
                controller: registrationController.r_email_controller,
                keyboardType: TextInputType.name),
            Customtextformfield(
                errorColor: Colors.red,
                validator: registrationController.validPhoneNumber,
                labelText: "Phone Number",
                hintText: "Enter Your Phone Number",
                controller: registrationController.r_phonecontroller,
                keyboardType: TextInputType.phone),
            Customtextformfield(
                errorColor: Colors.red,
                validator: registrationController.validpassword,
                labelText: "Password",
                hintText: "Enter Your Password",
                controller:
                    registrationController.r_password_controller,
                keyboardType: TextInputType.text),
            Customtextformfield(
                errorColor: Colors.red,
                // ignore: duplicate_ignore
                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                validator: (Value) =>
                    registrationController.validateConfirmPassword(
                        registrationController
                            .r_password_controller.text,
                        Value),
                labelText: "Confirm Password",
                hintText: "Re-enter your Password",
                controller: registrationController
                    .r_confirm_password_controller,
                keyboardType: TextInputType.text),
          ],
        )
        
        );
  }
}
