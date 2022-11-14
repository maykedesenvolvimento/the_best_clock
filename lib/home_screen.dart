import 'package:flutter/material.dart';
import 'package:the_best_clock/app_colors.dart';
import 'package:the_best_clock/clock_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.dark,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: 'Relógio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarmes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Cronômetro',
          ),
        ],
      ),
      backgroundColor: AppColors.dark,
      body: const ClockScreen(),
    );
  }
}
