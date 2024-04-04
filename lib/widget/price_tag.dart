import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/util/extension/int_extension.dart';
import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({super.key, required this.price});
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      decoration: BoxDecoration(
        color: ProjectColors.greyColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Text(
            price.convertToPrice(),
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontFamily: "SM",
              color: ProjectColors.redColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
