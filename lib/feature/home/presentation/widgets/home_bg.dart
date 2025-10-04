import 'package:flutter/material.dart';

class HomeBg extends StatelessWidget {
  const HomeBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -200,
          bottom: -170,
          child: Image.asset(
            "assets/images/Venus.png",
            width: 600,
            height: 600,
          ),
        ),
        Positioned(
          right: -330,
          top: -140,
          child: Image.asset(
            "assets/images/Earth.png",
            width: 750,
            height: 750,
          ),
        ),
      ],
    );
  }
}
