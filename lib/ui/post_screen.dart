import 'package:aviz/constants/constants.dart';
import 'package:aviz/util/extension/int_extension.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/icon_save.png"),
            Image.asset("assets/images/icon_share.png"),
            Image.asset("assets/images/icon_alert.png"),
          ],
        ),
        actions: [
          Image.asset("assets/images/icon_arrow_right.png"),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "16 دقیقه پیش در گرگان",
                    style: Theme.of(context).textTheme.bodySmall,
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                    height: 29,
                    decoration: BoxDecoration(
                      color: ProjectColors.greyColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Center(
                        child: Text(
                          "آپارتمان",
                          style: TextStyle(
                            fontFamily: "SM",
                            fontSize: 14,
                            color: ProjectColors.redColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "آپارتمان 500 متری در صیاد شیرازی",
                style: Theme.of(context).textTheme.bodyLarge,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(
                height: 25,
              ),
              Divider(
                indent: 0,
                endIndent: 0,
                color: ProjectColors.greyColor.withOpacity(0.2),
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ProjectColors.greyColor.withOpacity(0.2),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/icon_arrow_left_grey.png"),
                      Text(
                        "هشدار های قبل از معامله!",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                child: TabBar(
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 4),
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(
                    fontFamily: "SM",
                    fontSize: 14,
                  ),
                  unselectedLabelColor: ProjectColors.redColor,
                  unselectedLabelStyle:
                      const TextStyle(fontFamily: "SM", fontSize: 14),
                  indicator: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: ProjectColors.redColor,
                  ),
                  isScrollable: true,
                  controller: _controller,
                  tabs: const [
                    Tab(
                      text: "توضیحات",
                    ),
                    Tab(
                      text: "ویژگی ها و امکانات",
                    ),
                    Tab(
                      text: "قیمت",
                    ),
                    Tab(
                      text: "مشخصات",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _controller,
                  children: const [
                    DescriptionTab(),
                    FacilitiesTab(),
                    PriceTab(),
                    SpecificationsTab(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const InteractionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class InteractionButtons extends StatelessWidget {
  const InteractionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("اطلاعات تماس"),
                  const SizedBox(width: 6),
                  Image.asset("assets/images/icon_call.png"),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("گفتگو"),
                  const SizedBox(width: 6),
                  Image.asset("assets/images/icon_chat.png"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SpecificationsTab extends StatelessWidget {
  const SpecificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 98,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: ProjectColors.greyColor.withOpacity(0.2),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ساخت",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "1402",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  DottedLine(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "طبقه",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "دوبلکس",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  DottedLine(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "اتاق",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "6",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  DottedLine(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "متراژ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "500",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "موقعیت مکانی",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset("assets/images/icon_map.png"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/Frame 48 (1).png"),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class FacilitiesTab extends StatelessWidget {
  const FacilitiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "ویژگی ها",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 5),
              Image.asset("assets/images/icon_features.png"),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 112,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: ProjectColors.greyColor.withOpacity(0.2),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تک برگ",
                        style: TextStyle(
                            fontFamily: "SM",
                            fontSize: 16,
                            color: ProjectColors.greyColor),
                      ),
                      Text(
                        "سند",
                        style: TextStyle(
                            fontFamily: "SM",
                            fontSize: 16,
                            color: ProjectColors.greyColor),
                      ),
                    ],
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "شمالی",
                        style: TextStyle(
                            fontFamily: "SM",
                            fontSize: 16,
                            color: ProjectColors.greyColor),
                      ),
                      Text(
                        "جهت ساختمان",
                        style: TextStyle(
                            fontFamily: "SM",
                            fontSize: 16,
                            color: ProjectColors.greyColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "امکانات",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 5),
              Image.asset("assets/images/icon_facilities.png"),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 392,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: ProjectColors.greyColor.withOpacity(0.2),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "آسانسور",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: ProjectColors.greyColor,
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  const Text(
                    "پارکینگ",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: ProjectColors.greyColor,
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  const Text(
                    "انباری",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: ProjectColors.greyColor,
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  const Text(
                    "بالکن",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: ProjectColors.greyColor,
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  const Text(
                    "پنت هاوس",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: ProjectColors.greyColor,
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  const Text(
                    "جنس کف سرامیک",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: ProjectColors.greyColor,
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                  const Text(
                    "سرویس بهداشتی ایرانی و فرنگی",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: ProjectColors.greyColor,
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: ProjectColors.greyColor.withOpacity(0.2),
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "ویلا 500 متری در خیابان صیاد شیرازی ویو عالی وسط جنگل قیمت فوق العاده گذاشتم فروش فوری خریدار باشی تخفیف پای معامله میدم.",
            style: TextStyle(
              fontFamily: "SM",
              fontSize: 16,
              color: ProjectColors.greyColor,
            ),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

class PriceTab extends StatelessWidget {
  const PriceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          height: 96,
          decoration: BoxDecoration(
            border: Border.all(
              color: ProjectColors.greyColor.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      46460000.convertToPrice(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "قیمت هر متر:",
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: ProjectColors.greyColor.withOpacity(0.2),
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      23230000000.convertToPrice(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "قیمت کل:",
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
