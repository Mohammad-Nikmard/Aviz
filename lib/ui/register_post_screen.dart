import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/widget/facility_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

class RegisterPostScreen extends StatelessWidget {
  const RegisterPostScreen(
      {super.key,
      required this.callBack,
      required this.pop,
      required this.close});
  final VoidCallback callBack;
  final VoidCallback pop;
  final VoidCallback close;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                    SvgPicture.asset("assets/images/icon_facilities.svg"),
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
                  onPressed: callBack,
                  child: const Text("بعدی"),
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

class _FeatureSection extends StatefulWidget {
  const _FeatureSection();

  @override
  State<_FeatureSection> createState() => _FeatureSectionState();
}

class _FeatureSectionState extends State<_FeatureSection> {
  int meterage = 100;
  int roomNums = 1;
  int year = 1402;
  int floors = 0;
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
            SvgPicture.asset('assets/images/icon_features.svg'),
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
                GestureDetector(
                  onTap: () {
                    int freshValue = roomNums;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "بستن",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: ProjectColors.redColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  roomNums = freshValue;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "انتخاب",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                          content: StatefulBuilder(
                            // ignore: non_constant_identifier_names
                            builder: (context, SBsetState) {
                              return NumberPicker(
                                textStyle: const TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                selectedTextStyle: const TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 22,
                                  color: Colors.blue,
                                ),
                                value: freshValue,
                                minValue: 0,
                                maxValue: 10,
                                onChanged: (val) {
                                  setState(() {
                                    freshValue = val;
                                    SBsetState(() => freshValue = val);
                                  });
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
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
                          SvgPicture.asset('assets/images/icon_dec_inc.svg'),
                          Text(
                            "$roomNums",
                            style: const TextStyle(
                              fontFamily: "SM",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "سال ساخت",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    int freshValue = year;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "بستن",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: ProjectColors.redColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  year = freshValue;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "انتخاب",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                          content: StatefulBuilder(
                            // ignore: non_constant_identifier_names
                            builder: (context, SBsetState) {
                              return NumberPicker(
                                textStyle: const TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                selectedTextStyle: const TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 22,
                                  color: Colors.blue,
                                ),
                                value: freshValue,
                                minValue: 1300,
                                maxValue: 1403,
                                onChanged: (val) {
                                  setState(() {
                                    freshValue = val;
                                    SBsetState(() => freshValue = val);
                                  });
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
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
                          SvgPicture.asset('assets/images/icon_dec_inc.svg'),
                          Text(
                            "$year",
                            style: const TextStyle(
                              fontFamily: "SM",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
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
                  "متراژ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    int freshValue = meterage;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "بستن",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: ProjectColors.redColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  meterage = freshValue;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "انتخاب",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                          content: StatefulBuilder(
                            // ignore: non_constant_identifier_names
                            builder: (context, SBsetState) {
                              return NumberPicker(
                                textStyle: const TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                selectedTextStyle: const TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 22,
                                  color: Colors.blue,
                                ),
                                value: freshValue,
                                minValue: 55,
                                maxValue: 500,
                                onChanged: (val) {
                                  setState(() {
                                    freshValue = val;
                                    SBsetState(() => freshValue = val);
                                  });
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
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
                          SvgPicture.asset('assets/images/icon_dec_inc.svg'),
                          Text(
                            "$meterage",
                            style: const TextStyle(
                              fontFamily: "SM",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "طبقه",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    int freshValue = floors;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "بستن",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: ProjectColors.redColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  floors = freshValue;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "انتخاب",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                          content: StatefulBuilder(
                            // ignore: non_constant_identifier_names
                            builder: (context, SBsetState) {
                              return NumberPicker(
                                textStyle: const TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                selectedTextStyle: const TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 22,
                                  color: Colors.blue,
                                ),
                                value: freshValue,
                                minValue: 0,
                                maxValue: 30,
                                onChanged: (val) {
                                  setState(() {
                                    freshValue = val;
                                    SBsetState(() => freshValue = val);
                                  });
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
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
                          SvgPicture.asset('assets/images/icon_dec_inc.svg'),
                          Text(
                            "$floors",
                            style: const TextStyle(
                              fontFamily: "SM",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
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
            SvgPicture.asset('assets/images/icon_category.svg'),
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
                        icon: SvgPicture.asset(
                            'assets/images/icon_arrow_down.svg'),
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
