import 'package:aviz/widget/category_option_chip.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CategoryOptionChip(title: "اجاره مسکونی"),
            CategoryOptionChip(title: "فروش مسکونی"),
            CategoryOptionChip(title: "فروش دفاتر اداری و تجاری"),
            CategoryOptionChip(title: "اجاره دفاتر اداری و تجاری"),
            CategoryOptionChip(title: "اجاره کوتاه مدت"),
            CategoryOptionChip(title: "پروژه های ساخت و ساز"),
          ],
        ),
      ),
    );
  }
}
