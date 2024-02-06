import 'package:aviz/constants/constants.dart';
import 'package:aviz/ui/register_validation_screen.dart.dart';
import 'package:aviz/ui/login_screen.dart';
import 'package:aviz/widget/aviz_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _UpperBodyLayout(),
              Spacer(),
              _LoweBodyButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UpperBodyLayout extends StatelessWidget {
  const _UpperBodyLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const AvizWidget(),
            Text(
              "خوش اومدی به",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "این فوق العاده س که آویز رو برای آگهی هات انتخاب کردی!",
          style: Theme.of(context).textTheme.bodySmall,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: "نام و نام خانوادگی",
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
        const SizedBox(
          height: 20,
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

class _LoweBodyButtons extends StatelessWidget {
  const _LoweBodyButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegisterValidationScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/icon_arrow_left_white.png"),
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
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  "ورود",
                  style: TextStyle(
                    fontFamily: "SM",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ProjectColors.redColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                "قبلا ثبت نام کردی؟",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
