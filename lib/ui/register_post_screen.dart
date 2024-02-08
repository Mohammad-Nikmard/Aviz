import 'package:aviz/constants/constants.dart';
import 'package:aviz/ui/location_setting_screen.dart';
import 'package:aviz/widget/facility_chip.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class RegisterPostScreen extends StatelessWidget {
  const RegisterPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
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
            Image.asset("assets/images/icon_post_aviz.png"),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/icon_arrow_right.png"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: LinearProgressBar(
                maxSteps: 5,
                minHeight: 4,
                progressType:
                    LinearProgressBar.progressTypeLinear, // Use Linear progress
                currentStep: 3,
                progressColor: Colors.red,
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  const _ChooseCategorySection(),
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
                    height: 25,
                  ),
                  const _FeatureSection(),
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
                    height: 25,
                  ),
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
                  const SizedBox(height: 10),
                  const FacilityChip(title: "آسانسور"),
                  const FacilityChip(title: "پارکینگ"),
                  const FacilityChip(title: "انباری"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LocationSettingScreen(),
                        ),
                      );
                    },
                    child: const Text("بعدی"),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureSection extends StatelessWidget {
  const _FeatureSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "ویژگی ها",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 5),
            Image.asset('assets/images/icon_features.png')
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "تعداد اتاق",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                Container(
                  width: 159,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xffF9FAFB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/icon_increament.png"),
                            Image.asset("assets/images/icon_decreament.png"),
                          ],
                        ),
                        Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: const InputDecoration(
                                hintText: "6",
                                hintStyle: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: Color(0xffD0D5DD),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                    width: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "سال ساخت",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                Container(
                  width: 159,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xffF9FAFB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/icon_increament.png"),
                            Image.asset("assets/images/icon_decreament.png"),
                          ],
                        ),
                        Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                hintText: "1402",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                    width: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "متراژ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                Container(
                  width: 159,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xffF9FAFB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/icon_increament.png"),
                            Image.asset("assets/images/icon_decreament.png"),
                          ],
                        ),
                        Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                hintText: "350",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                    width: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "طبقه",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                Container(
                  width: 159,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xffF9FAFB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/icon_increament.png"),
                            Image.asset("assets/images/icon_decreament.png"),
                          ],
                        ),
                        Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                hintText: "0",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                    width: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ChooseCategorySection extends StatefulWidget {
  const _ChooseCategorySection();

  @override
  State<_ChooseCategorySection> createState() => _ChooseCategorySectionState();
}

class _ChooseCategorySectionState extends State<_ChooseCategorySection> {
  var _dropdownValue = "فروش آپارتمان";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "انتخاب دسته بندی آویز",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 5),
            Image.asset("assets/images/icon_category.png"),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "محدوده ملک",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                Container(
                  width: 159,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xffF9FAFB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Center(
                      child: Text(
                        "خیابان صیاد شیرازی",
                        style: TextStyle(
                          fontFamily: "SM",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffD0D5DD),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "دسته بندی",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                Container(
                  width: 159,
                  height: 48,
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
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButton(
                        items: [
                          DropdownMenuItem<String>(
                            value: "فروش آپارتمان",
                            child: Text(
                              "فروش آپارتمان",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "فروش اداره",
                            child: Text(
                              "فروش اداره",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "فروش زمین",
                            child: Text(
                              "فروش زمین",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                        icon: Image.asset("assets/images/icon_arrow-down.png"),
                        underline: Container(),
                        isExpanded: true,
                        value: _dropdownValue,
                        elevation: 4,
                        onChanged: (String? newValue) {
                          setState(() {
                            _dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
