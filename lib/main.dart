import 'package:flutter/material.dart';
import 'package:f1_bingo/screens/home_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
} 

class MyApp extends StatelessWidget {
  // constructor for MyApp
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}