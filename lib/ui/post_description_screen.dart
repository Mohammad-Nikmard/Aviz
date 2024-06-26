import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/widget/facility_chip.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostDescriptionScreen extends StatelessWidget {
  const PostDescriptionScreen(
      {super.key,
      required this.callback,
      required this.pop,
      required this.close});
  final VoidCallback callback;
  final VoidCallback pop;
  final VoidCallback close;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: Column(
              children: [
                const PostPicture(),
                const SizedBox(height: 30),
                const TitleAndDescription(),
                const SizedBox(height: 20),
                const FacilityChip(title: "فعال کردن گفتگو"),
                const FacilityChip(title: "فعال کردن تماس"),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("ثبت آگهی"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostPicture extends StatelessWidget {
  const PostPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "تصویر آویز",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 5),
            SvgPicture.asset('assets/images/icon_camera.svg'),
          ],
        ),
        const SizedBox(height: 20),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(5),
          padding: const EdgeInsets.all(6),
          dashPattern: const [6, 2],
          color: ProjectColors.greyColor.withOpacity(0.5),
          child: SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "لطفا تصویر آویز خود را بارگذاری کنید",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  width: 164,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontFamily: "SM",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("انتخاب تصویر"),
                        SvgPicture.asset(
                          "assets/images/icon_send_pic.svg",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "عنوان آویز",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 5),
            SvgPicture.asset('assets/images/icon_title.svg'),
          ],
        ),
        const SizedBox(height: 20),
        TextField(
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: "عنوان خود را وارد کنید",
            hintStyle: Theme.of(context).textTheme.bodySmall,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            filled: true,
            fillColor: const Color(0xffF9FAFB),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "توضیحات",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 5),
            SvgPicture.asset('assets/images/icon_description.svg'),
          ],
        ),
        const SizedBox(height: 20),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            maxLines: 4,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: "عنوان خود را وارد کنید ...",
              hintStyle: Theme.of(context).textTheme.bodySmall,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              filled: true,
              fillColor: const Color(0xffF9FAFB),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
