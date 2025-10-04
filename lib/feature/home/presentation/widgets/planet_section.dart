import 'package:flutter/material.dart';

class PlanetSection extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isImageRight;

  const PlanetSection({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.isImageRight = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Stack(
        children: [
          Align(
            alignment:
                isImageRight ? Alignment.centerRight : Alignment.centerLeft,
            child: Transform.translate(
              offset: isImageRight ? const Offset(80, 0) : const Offset(-80, 0),
              child: Image.asset(
                image,
                height: 700,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: isImageRight ? 30 : null,
            right: isImageRight ? null : 30,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8CA6DB),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            left: 24,
            right: 24,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
