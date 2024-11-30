import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  ThemeMode getThemeMode() {
    return isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

    void toggleTheMode() {
    isDarkMode.value =! isDarkMode.value;
  }
}
