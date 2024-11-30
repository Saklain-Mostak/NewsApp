

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailPhoneValidationController extends GetxController {
  final formkeyForgetPasswordmail = GlobalKey<FormState>();
  final formkeyForgetPasswordphone = GlobalKey<FormState>();

  // TextEditingController

  TextEditingController controllerforgetPasswordMail = TextEditingController();
  final TextEditingController controllerforgetPasswordPhone =
      TextEditingController();

  String? validPhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
      return 'Phone number must be 10 to 15 digits long';
    }
    return null;
  }

  String? validemail1(String? value) 
  
  {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    String pattern =
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter a valid email';
    } else if (!value.contains('.')) {
      return 'Email must contain a domain (e.g., .com)';
    }

    return null; 
  }
}
