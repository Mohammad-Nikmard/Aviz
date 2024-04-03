import 'package:aviz/ui/register_post_screen.dart';
import 'package:aviz/widget/category_option_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
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
            SvgPicture.asset(
              'assets/images/icon_close.svg',
            ),
            SvgPicture.asset('assets/images/icon_aviz_category.svg'),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/images/icon_arrow_right.svg'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: LinearProgressBar(
              maxSteps: 4,
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
