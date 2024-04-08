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
        color: background,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text(
        'Skip', 
        textAlign: TextAlign.center
      ),
    );
  }
}