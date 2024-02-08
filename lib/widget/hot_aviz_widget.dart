import 'package:aviz/constants/constants.dart';
import 'package:aviz/ui/post_detail_screen.dart';
import 'package:aviz/widget/price_tag.dart';
import 'package:flutter/material.dart';

class HotAvizWidget extends StatelessWidget {
  const HotAvizWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PostDetailScreen(),
          ),
        );
      },
      child: Container(
        height: 267,
        width: 224,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              spreadRadius: -25,
              blurRadius: 25,
              color: ProjectColors.greyColor,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
              const SizedBox(height: 15),
              Text(
                "ویلا 500 متری زیر قیمت",
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              const Text(
                "ویو عالی سند تک برگ سال ساخت 1402 تحویل فوری",
                style: TextStyle(
                  fontFamily: "SM",
                  fontSize: 12,
                  color: ProjectColors.greyColor,
                ),
              ),
              const Spacer(),
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
      ),
    );
  }
}
