import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/data/model/promotion.dart';
import 'package:aviz/ui/post_detail_screen.dart';
import 'package:aviz/widget/cached_image.dart';
import 'package:aviz/widget/price_tag.dart';
import 'package:flutter/material.dart';

class RecentAvizPost extends StatelessWidget {
  const RecentAvizPost({super.key, required this.promotion});
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
        height: 139,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: -25,
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
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                child: SizedBox(
                  height: 110,
                  width: 111,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: CachedImage(
                      imageURL: promotion.thumbnail!,
                      radius: 5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: Text(
                        promotion.title ?? "",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        promotion.description ?? "",
                        style: const TextStyle(
                          fontFamily: "SM",
                          fontSize: 12,
                          color: ProjectColors.greyColor,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PriceTag(
                          price: promotion.price ?? 123456789,
                        ),
                        const Spacer(),
                        const Text(
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
      ),
    );
  }
}
