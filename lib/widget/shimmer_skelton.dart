import 'package:flutter/material.dart';

class ShimmerSkelton extends StatelessWidget {
  const ShimmerSkelton(
      {super.key,
      required this.height,
      required this.radius,
      required this.width});
  final double radius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
      child: ColoredBox(
        color: Colors.grey.withOpacity(0.6),
        child: SizedBox(
          height: height,
          width: width,
        ),
      ),
    );
  }
}
