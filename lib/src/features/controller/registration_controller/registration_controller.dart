// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var obscureText = false.obs;

  final GlobalKey<FormState> r_registration_formkey=GlobalKey();
  TextEditingController r_email_controller = TextEditingController();
  TextEditingController r_password_controller = TextEditingController();
  TextEditingController r_confirm_password_controller = TextEditingController();
  TextEditingController r_namecontroller = TextEditingController();
  TextEditingController r_phonecontroller = TextEditingController();

  String? validName(String? value) {
    if (value!.isEmpty) {
      return 'Name cannot be empty ';
    } else if (value.length < 2 || value.length > 50) {
      return 'Name must be between 2 and 50 characters';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  String? validemail(String? value) {
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

  String? validpassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    // Check if confirm password matches the original password
    if (confirmPassword!.isEmpty) {
      return 'Confirm password cannot be empty';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null; // Passwords match
  }

  String? validPhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
      return 'Phone number must be 10 to 15 digits long';
    }
    return null;
  }
}
