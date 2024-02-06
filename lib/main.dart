import 'package:aviz/constants/constants.dart';
import 'package:aviz/ui/add_post_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ProjectColors.redColor,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            textStyle: const TextStyle(
              fontFamily: "SM",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontFamily: "SM",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ProjectColors.greyColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: "SM",
            fontSize: 16,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: "SM",
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 16,
          ),
          labelSmall: TextStyle(
            fontFamily: "SM",
            color: ProjectColors.redColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
      home: const AddPostScreen(),
    );
  }
}
