import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/data/model/promotion.dart';
import 'package:aviz/ui/post_detail_screen.dart';
import 'package:aviz/widget/cached_image.dart';
import 'package:aviz/widget/price_tag.dart';
import 'package:flutter/material.dart';

class HotAvizWidget extends StatelessWidget {
  const HotAvizWidget({super.key, required this.promotion});
  final Promotion promotion;

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
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                child: SizedBox(
                  height: 112,
                  child: CachedImage(
                    imageURL: promotion.thumbnail!,
                    radius: 5,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                promotion.title ?? "",
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                promotion.description ?? "",
                style: const TextStyle(
                  fontFamily: "SM",
                  fontSize: 12,
                  color: ProjectColors.greyColor,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    "قیمت:",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  PriceTag(
                    price: promotion.price ?? 123456789,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
