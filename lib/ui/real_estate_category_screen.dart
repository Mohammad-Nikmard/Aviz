import 'package:aviz/ui/residential_sales_category_screen.dart';
import 'package:aviz/widget/category_option_chip.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class RealEstateCategoryScreen extends StatelessWidget {
  const RealEstateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
      body: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: LinearProgressBar(
              maxSteps: 5,
              minHeight: 4,
              progressType:
                  LinearProgressBar.progressTypeLinear, // Use Linear progress
              currentStep: 1,
              progressColor: Colors.red,
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              children: [
                const CategoryOptionChip(title: "اجاره مسکونی"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ResidentialSalesCategoryScreen(),
                      ),
                    );
                  },
                  child: const CategoryOptionChip(title: "فروش مسکونی"),
                ),
                const CategoryOptionChip(title: "فروش دفاتر اداری و تجاری"),
                const CategoryOptionChip(title: "اجاره دفاتر اداری و تجاری"),
                const CategoryOptionChip(title: "اجاره کوتاه مدت"),
                const CategoryOptionChip(title: "پروژه های ساخت و ساز"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
