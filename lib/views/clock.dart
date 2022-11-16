import 'package:flutter/material.dart';
import 'package:the_best_clock/app_colors.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  final double _size = 200;
  final double _strokeWidth = 7.5;

  late int hour;
  late int minute;
  late int second;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  Future<void> _startTimer() async {
    final now = DateTime.now();

    hour = now.hour;
    minute = now.minute;
    second = now.second;

    while (mounted) {
      setState(() {
        second++;
        if (second == 60) {
          second = 0;
          minute++;
          if (minute == 60) {
            minute = 0;
            hour++;
            if (hour == 24) {
              hour = 0;
            }
          }
        }
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: _size,
            height: _size,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 28,
              ),
            ),
          ),
          SizedBox(
            width: _size - _strokeWidth,
            height: _size - _strokeWidth,
            child: CircularProgressIndicator(
              value: second / 60,
              strokeWidth: _strokeWidth,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
