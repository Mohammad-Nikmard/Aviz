import 'package:aviz/ui/register_post_screen.dart';
import 'package:aviz/widget/category_option_chip.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class ResidentialSalesCategoryScreen extends StatelessWidget {
  const ResidentialSalesCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
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
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/icon_arrow_right.png"),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: LinearProgressBar(
              maxSteps: 5,
              minHeight: 4,
              progressType:
                  LinearProgressBar.progressTypeLinear, // Use Linear progress
              currentStep: 2,
              progressColor: Colors.red,
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPostScreen(),
                      ),
                    );
                  },
                  child: const CategoryOptionChip(title: "فروش آپارتمان"),
                ),
                const CategoryOptionChip(title: "فروش خانه و ویلا"),
                const CategoryOptionChip(title: "فروش زمین و کلنگی"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
