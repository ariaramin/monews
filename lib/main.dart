import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:monews/models/agency.dart';
import 'package:monews/models/news.dart';
import 'package:monews/screen/splash_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NewsAdapter());
  Hive.registerAdapter(AgnecyAdapter());
  await Hive.openBox<News>("marked_news");
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
      home: SplashScreen(),
    );
  }
}
