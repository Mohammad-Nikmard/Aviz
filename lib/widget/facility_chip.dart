import 'package:aviz/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class FacilityChip extends StatefulWidget {
  const FacilityChip({super.key, required this.title});
  final String title;

  @override
  State<FacilityChip> createState() => _FacilityChipState();
}

class _FacilityChipState extends State<FacilityChip> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterSwitch(
                inactiveText: "",
                activeText: "",
                inactiveColor: const Color(0xffD0D5DD),
                activeColor: ProjectColors.redColor,
                width: 28.0,
                height: 20.0,
                toggleSize: 15.0,
                value: isTapped,
                borderRadius: 30.0,
                padding: 4.0,
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    isTapped = val;
                  });
                },
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
