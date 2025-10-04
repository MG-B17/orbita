import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Logo.png",
            width: 60,
            height: 50,
          ),
          const SizedBox(width: 5),
          Image.asset(
            "assets/images/RBITA.png",
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}
