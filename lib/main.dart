import 'package:flutter/material.dart';
import 'package:the_best_clock/home_screen.dart';

void main() {
  runApp(const TheBestClock());
}

class TheBestClock extends StatelessWidget {
  const TheBestClock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
