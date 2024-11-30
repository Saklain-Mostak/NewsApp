import 'package:flutter/material.dart';

class BottomSheetField extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback ontap;
  const BottomSheetField(  {
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.green[100], borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Icon(
                icon,
                size: 50,
              )),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(subtitle,
                      style: const TextStyle(
                        fontSize: 15,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
