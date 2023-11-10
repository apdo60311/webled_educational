import 'package:flutter/material.dart';
import 'package:webled_educational/core/constants.dart';
import 'package:webled_educational/screens/loading_screen.dart';
import 'package:webled_educational/screens/webview_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp._init();

  static const MyApp _instance = MyApp._init();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}
