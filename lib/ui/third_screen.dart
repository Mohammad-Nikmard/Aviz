import 'package:aviz/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:pinput/pinput.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
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
                Text(
                  "ارسال مجدد کد",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  width: 5,
                ),
                TimerCountdown(
                  timeTextStyle: const TextStyle(fontFamily: "SM"),
                  spacerWidth: 2,
                  enableDescriptions: false,
                  format: CountDownTimerFormat.minutesSeconds,
                  endTime: DateTime.now().add(
                    const Duration(
                      minutes: 00,
                      seconds: 60,
                    ),
                  ),
                  onEnd: () {
                    print("Timer finished");
                  },
                ),
              ],
            ),
            const Spacer(),
            Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
