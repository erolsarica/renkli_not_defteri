import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp_yellow/onboarding/intro_page_1.dart';
import 'package:todoapp_yellow/onboarding/intro_page_2.dart';
import 'package:todoapp_yellow/onboarding/intro_page_3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  // controller to keep track of which page we're on
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            PageView(
              controller: _controller,
              children: [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
            ],
          ),

          // dot indicators
          Container(
              alignment: Alignment(0, 0.75),
              child: SmoothPageIndicator(controller: _controller, count: 3))
        ],
      ),
    );
  }
}
