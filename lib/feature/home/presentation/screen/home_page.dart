import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/background_image.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/home_bg.dart';
import '../widgets/home_header.dart';
import '../widgets/planet_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. أضفنا متغيرًا لتتبع الصفحة النشطة
  int _selectedIndex = 0;

  // 2. أضفنا دالة لتغيير الصفحة عند الضغط على أيقونة
  void _onItemTapped(int index) {
    // إذا كنت تريد أن يظل المحتوى الرئيسي (الكواكب) ظاهرًا دائمًا
    // وأن تتغير فقط نافذة صغيرة أو جزء من الشاشة، فستحتاج إلى منطق مختلف.
    // لكن إذا كنت تريد التنقل بين صفحات كاملة، فهذا هو الكود الصحيح.
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [

      _buildHomePageContent(),
    //  const ChatPage(),
    ];

    return pages[_selectedIndex];
  }

  // 4. قمنا بنقل كل تصميم صفحتك الرئيسية إلى دالة منفصلة لتنظيم الكود
  Widget _buildHomePageContent() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headerHeight = 90.0;
    final double topPaddingForScroll = statusBarHeight + headerHeight;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const Positioned.fill(child: BackgroundImage()),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: topPaddingForScroll, bottom: 120),
            child: const Column(
              children: [
                SizedBox(
                  height: 600,
                  child: HomeBg(),
                ),
                PlanetSection(
                  title: "Mercury",
                  description:
                  "The smallest planet in the Solar System and the closest one to the Sun.\n"
                      "Mercury has no real atmosphere, which makes its surface extremely hot during the day\n"
                      "and freezing cold at night. A single year lasts only 88 Earth days,\n"
                      "but a single day on Mercury is longer than its year.",
                  image: "assets/images/Mercury.png",
                  isImageRight: true,
                ),
                PlanetSection(
                  title: "Venus",
                  description:
                  "Often called Earth’s twin because of its size and structure, but in reality it’s a hostile world.\n"
                      "Venus is covered in thick clouds of sulfuric acid, trapping heat and creating surface temperatures\n"
                      "hot enough to melt lead. It rotates in the opposite direction of most planets,\n"
                      "making its days longer than its years.",
                  image: "assets/images/Venus.png",
                  isImageRight: false,
                ),
                PlanetSection(
                  title: "Earth",
                  description:
                  "Our home planet and the only known world that supports life.\n"
                      "About 70% of Earth’s surface is covered with water, and its protective atmosphere shields us\n"
                      "from harmful radiation. Earth has the perfect balance of air, climate, and resources\n"
                      "that make it unique in the universe.",
                  image: "assets/images/Earth.png",
                  isImageRight: true,
                ),
                SizedBox(height: 160),
              ],
            ),
          ),

          /// الهيدر الثابت
          Positioned(
            top: statusBarHeight + 8,
            left: 0,
            right: 0,
            child: const HomeHeader(),
          ),

          /// البوتوم بار الثابت
          Positioned(
            left: 0,
            right: 0,
            bottom: 12,
            // 5. التعديل الأهم: مررنا الحالة الحالية والدالة إلى شريط التنقل
            child: CustomBottomNavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}