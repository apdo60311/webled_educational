import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:webled_educational/core/constants.dart';
import 'package:webled_educational/screens/webview_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: Constants.backgroundColor,
      );

  Column _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset('assets/images/webled.png'),
        const SizedBox(height: 20.0),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: _animatedText(),
          ),
        ),
        const Spacer(),
        const CircularProgressIndicator(
          color: Constants.primaryColor,
        ),
        const SizedBox(height: 40.0),
      ],
    );
  }

  AnimatedTextKit _animatedText() {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'بوابتك الأولي للتفوق',
          textStyle: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      totalRepeatCount: 1,
      pause: const Duration(microseconds: 1000),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
      onFinished: () {
        _naviagteToMainScreen();
      },
    );
  }

  void _naviagteToMainScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const WebViewScreen()));
    });
  }
}
