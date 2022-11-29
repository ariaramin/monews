import 'package:flutter/material.dart';
import 'package:monews/screen/explore_screen.dart';
import 'package:monews/screen/home_screen.dart';
import 'package:monews/screen/main_screen.dart';
import 'package:monews/screen/news_screen.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Shabnam",
      ),
      home: MainScreen(),
    );
  }
}
