import 'package:flutter/material.dart';
import 'package:news_app/src/features/screen/screen1/all_page/account_page.dart';
import 'package:news_app/src/features/screen/screen1/all_page/home_page.dart';
import 'package:news_app/src/features/screen/screen1/all_page/logout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Widget> item = [
     const HomePage(),
    const LogOut(),
    const AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: item[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.logout_rounded), label: "LogOut"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "Account"),
          ]),
    );
  }
}
