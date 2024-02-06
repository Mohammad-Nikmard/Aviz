import 'package:aviz/constants/constants.dart';
import 'package:aviz/widget/price_tag.dart';
import 'package:flutter/material.dart';

class HotAvizWidget extends StatelessWidget {
  const HotAvizWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 267,
      width: 224,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            spreadRadius: -10,
            blurRadius: 25,
            color: ProjectColors.greyColor,
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 112,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            const Spacer(),
            Text(
              "ویلا 500 متری زیر قیمت",
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              "ویو عالی سند تک برگ سال ساخت 1402 تحویل فوری",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  "قیمت:",
                  style: TextStyle(
                    fontFamily: "SM",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                PriceTag(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
