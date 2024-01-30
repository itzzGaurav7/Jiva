import 'package:flutter/material.dart';
import 'package:jiva/pages/home.dart';
import 'package:jiva/pages/sign_in.dart';
import 'package:jiva/pages/top_nav.dart';
import 'package:jiva/pages/onboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/onboard',
      routes: {
        '/onboard': (context) => OnboardingScreen(),
        '/nav': (context) => ResponsiveNavBarPage(),
        '/home': (context) => Homepage(),
        '/signin': (context) => SignInPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
