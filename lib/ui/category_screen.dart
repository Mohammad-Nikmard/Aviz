import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/ui/location_setting_screen.dart';
import 'package:aviz/ui/post_description_screen.dart';
import 'package:aviz/ui/real_estate_category_screen.dart';
import 'package:aviz/ui/register_post_screen.dart';
import 'package:aviz/ui/residential_sales_category_screen.dart';
import 'package:aviz/widget/category_option_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool headerCloseCondition = false;
  bool headerBackCondition = false;
  int pageNumber = 0;

  void pageToggle() {
    setState(() {
      if (pageNumber <= 5) {
        pageNumber++;
      }
    });
  }

  void close() {
    setState(() {
      pageNumber = 0;
    });
  }

  void pop() {
    setState(() {
      if (pageNumber > 0) {
        pageNumber--;
      }
    });
  }

  bool headerClose() {
    if (pageNumber != 0) {
      return headerCloseCondition = true;
    } else {
      return headerCloseCondition = false;
    }
  }

  bool headerBack() {
    if (pageNumber != 0) {
      return headerBackCondition = true;
    } else {
      return headerBackCondition = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              child: Visibility(
                visible: headerClose(),
                child: SvgPicture.asset(
                  'assets/images/icon_close.svg',
                ),
              ),
            ),
            SvgPicture.asset('assets/images/icon_aviz_category.svg'),
            GestureDetector(
              onTap: pop,
              child: Visibility(
                visible: headerBack(),
                child: SvgPicture.asset(
                  'assets/images/icon_arrow_right.svg',
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      height: 5,
                      duration: const Duration(milliseconds: 500),
                    ),
                  ),
                  AnimatedContainer(
                    height: 5,
                    width: progressCalculation(),
                    duration: const Duration(milliseconds: 500),
                    decoration: const BoxDecoration(
                      color: ProjectColors.redColor,
                    ),
                  ),
                ],
              ),
              if (pageNumber == 1) ...{
                RealEstateCategoryScreen(
                  callBack: pageToggle,
                  pop: pop,
                  close: close,
                )
              } else if (pageNumber == 2) ...{
                ResidentialSalesCategoryScreen(
                  callBack: pageToggle,
                  pop: pop,
                  close: close,
                )
              } else if (pageNumber == 3) ...{
                RegisterPostScreen(
                  callBack: pageToggle,
                  pop: pop,
                  close: close,
                )
              } else if (pageNumber == 4) ...{
                LocationSettingScreen(
                  callBack: pageToggle,
                  pop: pop,
                  close: close,
                )
              } else if (pageNumber == 5) ...{
                PostDescriptionScreen(
                  callback: pageToggle,
                  pop: pop,
                  close: close,
                )
              } else ...{
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: pageToggle,
                        child: const CategoryOptionChip(title: "دسته بندی"),
                      ),
                    ],
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }

  double progressCalculation() {
    double linearCal = MediaQuery.of(context).size.width / 5;
    double linearWidth = 0;

    switch (pageNumber) {
      case 1:
        return linearWidth = linearCal;
      case 2:
        return linearWidth = (linearCal * 2);
      case 3:
        return linearWidth = (linearCal * 3);
      case 4:
        return linearWidth = (linearCal * 4);
      case 5:
        return linearWidth = (linearCal * 5);
      default:
        return linearWidth;
    }
  }
}
