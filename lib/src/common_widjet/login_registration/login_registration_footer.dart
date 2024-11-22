import 'package:flutter/material.dart';

class LogInRegistrationFooter extends StatelessWidget {
  const LogInRegistrationFooter({
    super.key,
    required this.width,
    this.signupSigninText,
    this.haveAccountText,
    this.textButtonWidgetforgetPassword,
    required this.onPressedsignupSigninText,
  });

  final double width;
  final String? signupSigninText;
  final String? haveAccountText;
  final TextButton? textButtonWidgetforgetPassword;
  final VoidCallback onPressedsignupSigninText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,

            //text button
            child: textButtonWidgetforgetPassword),
        const Center(
          child: Text(
            "OR",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: width,
            child: OutlinedButton.icon(
              onPressed: () {},
              label: const Text(
                "Sign in with Google",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Image.asset(
                "assets/images/google_image1.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              haveAccountText!,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: onPressedsignupSigninText,
                //() => Get.off((const Registration())),
                child: Text(
                  signupSigninText!,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
          ],
        )
      ],
    );
  }
}
