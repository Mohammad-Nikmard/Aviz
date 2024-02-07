import 'package:aviz/widget/category_option_chip.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/icon_close.png",
              height: 24,
              width: 24,
            ),
            Image.asset("assets/images/icon_category_header.png"),
            Image.asset("assets/images/icon_arrow_right.png"),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            CategoryOptionChip(title: "فروش آپارتمان"),
            CategoryOptionChip(title: "فروش خانه و ویلا"),
            CategoryOptionChip(title: "فروش زمین و کلنگی"),
          ],
        ),
      ),
    );
  }
}
