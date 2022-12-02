import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:monews/constants/constants.dart';
import 'package:monews/screen/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: 1800),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
          (route) => false,
        );
      },
    );
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: Svg("images/pattern.svg"),
          repeat: ImageRepeat.repeat,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Image(
                  image: Svg(
                    'images/logo.svg',
                    size: Size(168, 92),
                  ),
                ),
              ),
              Positioned(
                bottom: 32,
                child: Column(
                  children: [
                    Text(
                      'توسعه',
                      style: TextStyle(
                        fontSize: 12,
                        color: greyColor,
                      ),
                    ),
                    Text(
                      'ExpertFlutter',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
