import 'package:aviz/widget/category_option_chip.dart';
import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            children: [
              const CategoryOptionChip(title: "اجاره مسکونی"),
              GestureDetector(
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
    );
  }
}
