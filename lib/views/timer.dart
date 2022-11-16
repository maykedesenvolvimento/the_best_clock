import 'package:flutter/material.dart';
import '../app_colors.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tela de cronômetro',
        style: TextStyle(
          fontSize: 20,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
