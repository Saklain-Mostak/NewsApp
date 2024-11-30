// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news_app/src/features/controller/log_in_controller/login_controller.dart';
import 'package:news_app/src/features/controller/registration_controller/registration_controller.dart';

class LogInRegistrationButton extends StatelessWidget {
  const LogInRegistrationButton(
      {super.key,
      this.login_controller,
      required this.height,
      required this.width,
      this.registrationController,
      required this.login_registration_text,
      required this.ontap});

  final LogInController? login_controller;
  final RegistrationController? registrationController;
  final double height;
  final double width;
  final String login_registration_text;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>ontap(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(27), bottomRight: Radius.circular(27)),
          ),
          height: height / 16,
          width: width / 2,
          child: Center(
              child: Text(
            login_registration_text.toUpperCase(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
