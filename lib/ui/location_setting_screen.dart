import 'package:aviz/ui/post_description_screen.dart';
import 'package:aviz/widget/facility_chip.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class LocationSettingScreen extends StatelessWidget {
  const LocationSettingScreen({super.key});

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
            Image.asset("assets/images/icon_category_header.png"),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/icon_arrow_right.png"),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: LinearProgressBar(
              maxSteps: 4,
              minHeight: 4,
              progressType:
                  LinearProgressBar.progressTypeLinear, // Use Linear progress
              currentStep: 3,
              progressColor: Colors.red,
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
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
                Image.asset("assets/images/map_image.png"),
                const SizedBox(height: 25),
                const FacilityChip(title: "موقعیت دقیق نقشه نمایش داده شود؟"),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PostDescriptionScreen(),
                        ),
                      );
                    },
                    child: const Text("بعدی"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
