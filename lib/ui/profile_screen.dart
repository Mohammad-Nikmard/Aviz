import 'package:aviz/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: SvgPicture.asset(
          'assets/images/icon_my_aviz.svg',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const SearchBox(),
                const SizedBox(
                  height: 30,
                ),
                const _Profile(),
                const SizedBox(
                  height: 35,
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
                const _OptionChip(
                    title: "آگهی های من", image: "icon_posts.svg"),
                const _OptionChip(
                    title: "پرداخت های من", image: "icon_card.svg"),
                const _OptionChip(
                    title: "بازدید های اخیر", image: "icon_eye.svg"),
                const _OptionChip(
                    title: "ذخیره شده ها", image: "icon_saved_posts.svg"),
                const _OptionChip(title: "تنظیمات", image: "icon_setting.svg"),
                const _OptionChip(
                    title: "پشتیبانی و قوانین", image: "icon_backup.svg"),
                const _OptionChip(title: "درباره آویز", image: "icon_info.svg"),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "نسخه",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "1.5.9",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OptionChip extends StatelessWidget {
  const _OptionChip({required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 40,
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/icon_arrow_left.svg',
              colorFilter: ColorFilter.mode(
                Colors.grey[400]!,
                BlendMode.srcIn,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  'assets/images/$image',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffF2F4F7),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: "جستجو...",
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/images/icon_search.svg',
            ),
          ],
        ),
      ),
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "حساب کاربری",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SvgPicture.asset(
              'assets/images/icon_profile.svg',
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 95,
          decoration: BoxDecoration(
            border: Border.all(
              color: ProjectColors.greyColor.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icon_edit.svg',
                          ),
                          const Spacer(),
                          Text(
                            "محمد نیک مرد",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 26,
                            width: 66,
                            decoration: const BoxDecoration(
                              color: ProjectColors.redColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "تایید شده",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "09377964183",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 56,
                  width: 56,
                  decoration: const ShapeDecoration(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(45),
                      ),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/IMG_0208.JPG"),
                      fit: BoxFit.cover,
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
