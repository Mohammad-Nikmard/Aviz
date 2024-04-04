import 'package:aviz/widget/facility_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationSettingScreen extends StatelessWidget {
  const LocationSettingScreen(
      {super.key,
      required this.callBack,
      required this.pop,
      required this.close});
  final VoidCallback callBack;
  final VoidCallback pop;
  final VoidCallback close;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  SvgPicture.asset('assets/images/icon_map.svg'),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: callBack,
                  child: const Text("بعدی"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
