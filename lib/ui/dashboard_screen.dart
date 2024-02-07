import 'package:aviz/constants/constants.dart';
import 'package:aviz/ui/add_post_screen.dart';
import 'package:aviz/ui/home_screen.dart';
import 'package:aviz/ui/login_screen.dart';
import 'package:aviz/ui/profile_screen.dart';
import 'package:flutter/material.dart';

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
        height: 65,
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
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset("assets/images/icon_profile.png"),
              ),
              label: "آویز آگهی ها",
              activeIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/images/icon_profile_active.png"),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/images/icon_add.png"),
              ),
              label: "آویز آگهی ها",
              activeIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/images/icon_add_active.png"),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/images/icon_search.png"),
              ),
              label: "آویز آگهی ها",
              activeIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/images/icon_home_active.png"),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/images/icon_home.png"),
              ),
              label: "آویز آگهی ها",
              activeIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/images/icon_home_active.png"),
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        children: [
          ProfileScreen(),
          AddPostScreen(),
          LoginScreen(),
          HomeScreen(),
        ],
        index: selectedIndex,
      ),
    );
  }
}
