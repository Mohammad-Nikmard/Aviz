import 'package:aviz/widget/category_option_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class RealEstateCategoryScreen extends StatelessWidget {
  const RealEstateCategoryScreen(
      {super.key,
      required this.callBack,
      required this.pop,
      required this.close});
  final VoidCallback callBack;
  final VoidCallback pop;
  final VoidCallback close;

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
            GestureDetector(
              onTap: close,
              child: SvgPicture.asset(
                'assets/images/icon_close.svg',
              ),
            ),
            SvgPicture.asset('assets/images/icon_aviz_category.svg'),
            GestureDetector(
              onTap: pop,
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
              currentStep: 0,
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
                  // onTap: () {
                  //   // Navigator.push(
                  //   //   context,
                  //   //   MaterialPageRoute(
                  //   //     builder: (context) =>
                  //   //         const ResidentialSalesCategoryScreen(),
                  //   //   ),
                  //   // );
                  // },
                  onTap: callBack,
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
