import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/ui/onboarding_screen.dart';
import 'package:aviz/ui/real_estate_category_screen.dart';
import 'package:aviz/ui/home_screen.dart';
import 'package:aviz/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          selectedFontSize: 14,
          selectedItemColor: ProjectColors.redColor,
          selectedLabelStyle: const TextStyle(
            fontFamily: "SM",
          ),
          unselectedFontSize: 14,
          unselectedItemColor: ProjectColors.greyColor,
          unselectedLabelStyle: const TextStyle(fontFamily: "SM"),
          elevation: 1,
          backgroundColor: const Color(0xffF9FAFB),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  'assets/images/profile_circle.svg',
                ),
              ),
              label: "آویز من",
              activeIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  'assets/images/profile_circle.svg',
                  colorFilter: const ColorFilter.mode(
                    ProjectColors.redColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  'assets/images/icon_add.svg',
                ),
              ),
              label: "افزودن آویز",
              activeIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  'assets/images/icon_add.svg',
                  colorFilter: const ColorFilter.mode(
                    ProjectColors.redColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  'assets/images/icon_search.svg',
                ),
              ),
              label: "جستجو",
              activeIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  'assets/images/icon_search.svg',
                  colorFilter: const ColorFilter.mode(
                    ProjectColors.redColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  'assets/images/app_logo_light.svg',
                ),
              ),
              label: "آویز آگهی ها",
              activeIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  'assets/images/aviz_logo.svg',
                ),
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          ProfileScreen(),
          RealEstateCategoryScreen(),
          OnBoardingScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
