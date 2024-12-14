import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/firebase_options.dart';
//import 'package:news_app/src/features/screen/login_screen/login.dart';
// ignore: unused_import

import 'package:news_app/src/features/controller/theme_controller/theme_controller.dart';
import 'package:news_app/src/features/screen/login_screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NewsApp',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.getThemeMode(),
        home:

            //const Registration()

            const LogIn()
        //const HomeScreen()

        //const HomePage(),

        ));
  }
}
