import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  // المتغيرات المطلوبة للتحكم في الـ Widget
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_rounded, "Home", 0),
            _buildNavItem(Icons.file_download_outlined, "Files", 1),
            _buildNavItem(Icons.smart_toy_outlined, "Chat", 2),
          ],
        ),
      ),
    );
  }

  // دالة خاصة لرسم كل أيقونة
  Widget _buildNavItem(IconData icon, String label, int index) {
    // التحقق إذا كانت هذه الأيقونة هي المختارة حاليًا
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        width: 60,
        height: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple.shade400.withOpacity(0.8) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: isSelected ? 28 : 26,
          color: isSelected ? Colors.white : Colors.blueGrey.shade200,
        ),
      ),
    );
  }
}