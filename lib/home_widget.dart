import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_scroll_behavior.dart';
import 'views/clock.dart';
import 'views/alarms_screen.dart';
import 'views/timer.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _currentPage = 0;
  void setCurrentPage(int index) => setState(() => _currentPage = index);

  late final PageController _pageController = PageController(
    initialPage: _currentPage,
  );

  changePage(int index) async {
    await _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
    setCurrentPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: changePage,
        backgroundColor: AppColors.secondary,
        selectedItemColor: AppColors.primary,
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
      backgroundColor: AppColors.secondary,
      body: PageView(
        controller: _pageController,
        onPageChanged: setCurrentPage,
        scrollBehavior: AppScrollBehavior(),
        children: const [
          ClockScreen(),
          AlarmsScreen(),
          TimerScreen(),
        ],
      ),
    );
  }
}
