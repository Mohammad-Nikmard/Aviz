import 'package:aviz/constants/constants.dart';
import 'package:aviz/widget/aviz_widget.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _UpperBody(),
            Spacer(),
            _Buttons(),
          ],
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: ProjectColors.redColor,
                      side: const BorderSide(
                        color: ProjectColors.redColor,
                        width: 2,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "ورود",
                      style: TextStyle(
                        fontFamily: "SM",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("ثبت نام"),
                  ),
                ),
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
          height: 50,
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset("images/background_splash.png"),
            Image.asset("images/logo_splash.png"),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "آگهی شماست",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const AvizWidget(),
            Text(
              "اینجا محل",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "در آویز ملک خود را برای فروش , اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
