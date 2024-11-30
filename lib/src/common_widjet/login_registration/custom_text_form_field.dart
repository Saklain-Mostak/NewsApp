import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  final Color? errorColor;

  const Customtextformfield(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.obscureText = false,
      required this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.errorColor = Colors.amber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(19),
            labelStyle: TextStyle(
                fontSize: 20, foreground: Paint(), fontWeight: FontWeight.bold),
            hintStyle: const TextStyle(
              fontSize: 20,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            suffixIcon: suffixIcon,
            labelText: labelText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            errorStyle: TextStyle(color: errorColor, fontSize: 14)),
      ),
    );
  }
}
