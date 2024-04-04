import 'package:aviz/widget/category_option_chip.dart';
import 'package:flutter/material.dart';

class ResidentialSalesCategoryScreen extends StatelessWidget {
  const ResidentialSalesCategoryScreen(
      {super.key,
      required this.callBack,
      required this.pop,
      required this.close});
  final VoidCallback callBack;
  final VoidCallback pop;
  final VoidCallback close;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            children: [
              GestureDetector(
                onTap: callBack,
                child: const CategoryOptionChip(title: "فروش آپارتمان"),
              ),
              const CategoryOptionChip(title: "فروش خانه و ویلا"),
              const CategoryOptionChip(title: "فروش زمین و کلنگی"),
            ],
          ),
        ),
      ],
    );
  }
}
