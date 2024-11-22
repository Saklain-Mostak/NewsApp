// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  var obscureText = false.obs;
  var l_login_formkey = GlobalKey<FormState>();


  TextEditingController login_email_controller = TextEditingController();
  TextEditingController login_password_controller = TextEditingController();

  String? validemail(String? value) {
    // ignore: unnecessary_null_comparison
    if (value == null || value.isEmpty) {
      return "Email is required";
      // Get.snackbar("Insert email?", "Email is required");
    }
    String pattern =
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter a valid email'; // Error message when email format is invalid
    } else if (!value.contains('.')) {
      return 'Email must contain a domain (e.g., .com)';
    }
    return null;
  }


String? validpassword(String? value) {
 
 
       if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // Password must be at least 8 characters long
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    // Check for lowercase letters
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null; // Valid password
  }}