import 'package:aviz/constants/constants.dart';
import 'package:aviz/widget/price_tag.dart';
import 'package:flutter/material.dart';

class RecentAvizPost extends StatelessWidget {
  const RecentAvizPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 139,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: -10,
            blurRadius: 25,
            color: ProjectColors.greyColor,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Text(
                      "واحد دوبلکس فول امکانات",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    child: Text(
                      "سال ساخت 1398 سند تک برگ دوبلکس تجهیزات کامل",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PriceTag(),
                      Spacer(),
                      Text(
                        "قیمت: ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: "SM",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
