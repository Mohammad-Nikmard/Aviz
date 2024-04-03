import 'package:aviz/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvizWidget extends StatelessWidget {
  const AvizWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 26,
      width: 64,
      decoration: BoxDecoration(
        color: ProjectColors.greyColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: SvgPicture.asset(
        'assets/images/icon_aviz.svg',
      ),
    );
  }
}
