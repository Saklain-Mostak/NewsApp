import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/common_widjet/login_registration/forget/forget_sheet_field.dart';
import 'package:news_app/src/features/screen/forget_screen/forger_password_mail/forget_password_mail.dart';
import 'package:news_app/src/features/screen/forget_screen/forget_password_phone/forget_password_phone.dart';

class ForgetBottomSheetVerification extends StatelessWidget {
  const ForgetBottomSheetVerification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Make Section!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Select.One of the option given bellow to reset your passwod.",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            BottomSheetField(
              icon: Icons.message_outlined,
              title: "Email",
              subtitle: "Reset Via Mail Verifiaction",
              ontap: () => Get.off(const ForgetPasswordMail()),
            ),
            const SizedBox(
              height: 17,
            ),
            BottomSheetField(
              icon: Icons.phone_android_outlined,
              title: "Phone",
              subtitle: "Reset Via phone Verification",
              ontap: () =>
               Get.off(const ForgetPasswordPhone()),
            ),
          ],
        ),
      ),
    );
  }
}
