// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class LoginRegistrationHeader extends StatelessWidget {
  const LoginRegistrationHeader({
    super.key,
    required this.height,
    required this.width, required this.login_registration_text,
  });

  final double height;
  final double width;
  final String login_registration_text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: height / 6,
            width: width / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.asset(
                // alignment: Alignment.center,
                "assets/images/news-app-100.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
           Text(
            login_registration_text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              // color: Colors.black,
              fontSize: 28,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w700,
            ),
            //         Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}