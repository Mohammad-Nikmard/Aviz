import 'dart:async';
import 'package:aviz/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class LoginValidationScreen extends StatefulWidget {
  const LoginValidationScreen({super.key});

  @override
  State<LoginValidationScreen> createState() => _LoginValidationScreenState();
}

class _LoginValidationScreenState extends State<LoginValidationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _InputValidation(),
              Spacer(),
              _ActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputValidation extends StatefulWidget {
  const _InputValidation();

  @override
  State<_InputValidation> createState() => _InputValidationState();
}

class _InputValidationState extends State<_InputValidation> {
  late Timer timer;
  int start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 60,
        ),
        Text(
          "تایید شماره موبایل",
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.end,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "کد ورود پیامک شده را وارد کنید",
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.end,
        ),
        const SizedBox(
          height: 25,
        ),
        Pinput(
          onCompleted: (pin) => print(pin),
          defaultPinTheme: PinTheme(
            width: 73,
            height: 48,
            textStyle: Theme.of(context).textTheme.bodyMedium,
            decoration: BoxDecoration(
              color: ProjectColors.greyColor.withOpacity(0.07),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          submittedPinTheme: PinTheme(
            width: 73,
            height: 48,
            textStyle: Theme.of(context).textTheme.bodyMedium,
            decoration: BoxDecoration(
              color: ProjectColors.greyColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (start == 0) {
                  setState(() {
                    start = 60;
                    startTimer();
                  });
                }
              },
              child: Text(
                "ارسال مجدد کد",
                style: TextStyle(
                  fontFamily: "SM",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: start == 0
                      ? ProjectColors.redColor
                      : ProjectColors.greyColor,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "00:$start${(start == 0) ? 0 : ''}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("تایید ورود"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
