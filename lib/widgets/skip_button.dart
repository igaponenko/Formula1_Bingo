import 'package:flutter/material.dart';
import '../constants.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key, required this.skipDriver}) : super(key: key);
  final VoidCallback skipDriver;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: skipDriver,
      child: Container(
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
      ),
    );
  }
}