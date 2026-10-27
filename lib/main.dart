import 'package:flutter/material.dart';
import 'package:pmm_pf2/screens/home_screen.dart';
import 'package:pmm_pf2/screens/personal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevProfile & Widget Showcase",
      routes: {
        "/": (context) => HomeScreen(),
        "/personal_screen":(context) => PersonalScreen(),
      },
    );
  }
}
