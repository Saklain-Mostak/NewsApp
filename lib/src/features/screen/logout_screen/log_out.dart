import 'package:flutter/material.dart';
import 'package:news_app/src/features/controller/auth_controller/auth_controller.dart';

class LogOut extends StatelessWidget {
  const LogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AuthController.instance.logout();
        },
        child: const Icon(Icons.logout_rounded));
  }
}
