import 'package:get/get.dart';
import 'package:news_app/src/features/controller/auth_controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
