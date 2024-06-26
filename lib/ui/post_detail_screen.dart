import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/util/extension/int_extension.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen>
    with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    _controller!.index = 3;
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
        leadingWidth: 145,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'assets/images/icon_save.svg',
              ),
              SvgPicture.asset(
                'assets/images/icon_share.svg',
              ),
              SvgPicture.asset(
                'assets/images/icon_alert.svg',
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/images/icon_arrow_right.svg',
              ),
            ),
          ),
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
                height: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/post_background.png"),
                    fit: BoxFit.cover,
                  ),
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
                      SvgPicture.asset(
                        'assets/images/icon_arrow_left.svg',
                        colorFilter: ColorFilter.mode(
                          Colors.grey[400]!,
                          BlendMode.srcIn,
                        ),
                      ),
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
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: const EdgeInsets.only(left: 8),
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
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("اطلاعات تماس"),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    'assets/images/icon_call.svg',
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("گفتگو"),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    'assets/images/icon_chat.svg',
                  ),
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
              SvgPicture.asset(
                'assets/images/icon_map.svg',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/map_image.png"),
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
              SvgPicture.asset(
                'assets/images/icon_features.svg',
              ),
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
              SvgPicture.asset(
                'assets/images/icon_facilities.svg',
              ),
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
