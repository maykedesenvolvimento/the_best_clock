import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_best_clock/app_colors.dart';
import 'package:the_best_clock/home_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.secondary,
            selectionColor: AppColors.primary,
            selectionHandleColor: AppColors.primary,
          ),
          timePickerTheme: const TimePickerThemeData(
            dialHandColor: AppColors.secondary,
            hourMinuteColor: AppColors.secondary,
            hourMinuteTextColor: Colors.white,
            helpTextStyle: TextStyle(
              color: AppColors.secondary,
              fontSize: 16,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              visualDensity: VisualDensity.standard,
              backgroundColor: MaterialStateProperty.all(
                AppColors.secondary,
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                AppColors.secondary,
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            focusColor: AppColors.secondary,
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
          primaryColor: AppColors.primary,
          secondaryHeaderColor: AppColors.secondary,
        ),
        home: const HomeWidget(),
      ),
    );
  }
}
