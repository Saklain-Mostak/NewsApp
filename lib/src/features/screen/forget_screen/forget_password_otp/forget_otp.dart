// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:news_app/src/features/screen/demo_screen/demo_screen.dart';

class ForgetOtp extends StatelessWidget {
  const ForgetOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  "CODE",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Verification",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                OtpTextField(
                    numberOfFields: 6,
                    borderColor: const Color(0xFF512DA8),
                    fillColor: Colors.black26,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      Get.snackbar(
                          "Verification Code", "Code : $verificationCode");
                    }),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: Size.infinite.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[200],
                      ),
                      onPressed: () {
                        Get.to(() => const DemoScreen());
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
