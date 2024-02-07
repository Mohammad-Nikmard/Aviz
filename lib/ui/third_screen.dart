import 'package:aviz/widget/facility_chip.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "موقعیت مکانی",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(width: 5),
                Image.asset("assets/images/icon_map.png"),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              "بعد از انتخاب محل دقیق روی نقشه میتوانید آن را فعال یا غیر فعال کنید تا حریم خصوصی شما حفظ شود",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 30),
            Image.asset("assets/images/Frame 48 (1).png"),
            const SizedBox(height: 25),
            const FacilityChip(title: "موقعیت دقیق نقشه نمایش داده شود؟"),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 40),
              ),
              onPressed: () {},
              child: const Text("بعدی"),
            ),
          ],
        ),
      ),
    );
  }
}
