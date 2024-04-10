import 'package:flutter/material.dart';
import '../constants.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});
  // const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: button,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text(
        'Skip driver', 
        textAlign: TextAlign.center,
        style: TextStyle(
          color: normal,
          fontSize: 20.0,
          fontFamily: 'Formula1',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}