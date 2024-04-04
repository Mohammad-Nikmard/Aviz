import 'package:aviz/ui/location_setting_screen.dart';
import 'package:aviz/ui/post_description_screen.dart';
import 'package:aviz/ui/real_estate_category_screen.dart';
import 'package:aviz/ui/register_post_screen.dart';
import 'package:aviz/ui/residential_sales_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int pageNumber = 0;
  void pageToggle() {
    setState(() {
      if (pageNumber <= 4) {
        pageNumber++;
      }
    });
  }

  void close() {
    setState(() {
      pageNumber = 5;
    });
  }

  void pop() {
    setState(() {
      if (pageNumber > 0) {
        pageNumber--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pageNumber == 0) {
      return RealEstateCategoryScreen(
        callBack: pageToggle,
        pop: pop,
        close: close,
      );
    } else if (pageNumber == 1) {
      return ResidentialSalesCategoryScreen(
        callBack: pageToggle,
        pop: pop,
        close: close,
      );
    } else if (pageNumber == 2) {
      return RegisterPostScreen(
        callBack: pageToggle,
        pop: pop,
        close: close,
      );
    } else if (pageNumber == 3) {
      return LocationSettingScreen(
        callBack: pageToggle,
        pop: pop,
        close: close,
      );
    } else if (pageNumber == 4) {
      return PostDescriptionScreen(
        callback: pageToggle,
        pop: pop,
        close: close,
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageNumber = 0;
                  });
                },
                child: Text("شروع"),
              ),
            ],
          ),
        ),
      );
    }
  }
}
