import 'package:aviz/constants/constants.dart';
import 'package:aviz/widget/facility_chip.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/icon_close.png",
              height: 24,
              width: 24,
            ),
            Image.asset("assets/images/icon_category_header.png"),
            Image.asset("assets/images/icon_arrow_right.png"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "تصویر آویز",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 5),
                  Image.asset("assets/images/icon_camera.png"),
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
                        width: 154,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              const Text("انتخاب تصویر"),
                              const Spacer(),
                              Image.asset("assets/images/icon_send_pic.png",
                                  height: 24, width: 24),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "عنوان آویز",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 5),
                  Image.asset("assets/images/icon_title.png")
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
                  fillColor: ProjectColors.greyColor.withOpacity(0.1),
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
                  Image.asset("assets/images/icon_description.png")
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 15),
                    filled: true,
                    fillColor: ProjectColors.greyColor.withOpacity(0.1),
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
              const SizedBox(height: 20),
              const FacilityChip(title: "فعال کردن گفتگو"),
              const FacilityChip(title: "فعال کردن تماش"),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 40),
                ),
                onPressed: () {},
                child: const Text("ثبت آگهی"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
