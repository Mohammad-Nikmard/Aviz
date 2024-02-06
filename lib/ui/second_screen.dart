import 'package:aviz/constants/constants.dart';
import 'package:aviz/widget/aviz_widget.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _UpperBody(),
              Spacer(),
              _LoweBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoweBody extends StatelessWidget {
  const _LoweBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/icon_arrow-left_white.png"),
                        const Text("مرحله بعد"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "ثبت نام",
                  style: TextStyle(
                    fontFamily: "SM",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ProjectColors.redColor,
                  ),
                ),
              ),
              Text(
                "تا حالا ثبت نام نکردی؟",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UpperBody extends StatelessWidget {
  const _UpperBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const AvizWidget(),
            Text(
              "ورود به ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "خوشحالیم که آویز رو مجددا برای آگهی انتخاب کردی!",
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.start,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(
          height: 25,
        ),
        TextField(
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: "شماره موبایل",
            hintStyle: Theme.of(context).textTheme.bodySmall,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            filled: true,
            fillColor: ProjectColors.greyColor.withOpacity(0.1),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
