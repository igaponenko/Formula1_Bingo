import 'dart:math';
import 'package:flutter/material.dart';
import 'package:f1_bingo/constants.dart';

class OptionsCard extends StatelessWidget {
  final String option;
  final Color color;
  final int index;

  const OptionsCard({
    Key? key,
    required this.option,
    required this.color,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define two colors for the checkers pattern

    // Determine the color based on the index position
    final Color colorPattern =
        (index ~/ 4 + index % 4) % 2 == 0 ? grid1 : grid2;

    return Card(
      margin: EdgeInsets.zero, // Ensure zero margin
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      color: colorPattern,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0), 
          child: Container(
            color: color,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 50,
                    child: Image.asset(
                      'assets/images/$option.png',
                      fit: BoxFit.contain, // Ensure image fits within container
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 2, right: 2),
                  child: Text(
                    option.splitMapJoin('_',
                        onMatch: (m) => ' ', onNonMatch: (n) => n),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
