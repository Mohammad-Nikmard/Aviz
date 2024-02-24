import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/ui/register_screen.dart';
import 'package:aviz/ui/login_validation_screen.dart';
import 'package:aviz/widget/aviz_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _InputFields(),
              Spacer(),
              _ActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

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
                          builder: (context) => const LoginValidationScreen(),
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
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
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
              const SizedBox(
                width: 2,
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

class _InputFields extends StatelessWidget {
  const _InputFields();

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
            fillColor: const Color(0xffF9FAFB),
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
