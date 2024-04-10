import 'package:flutter/material.dart';
// import '../constants.dart';

class OptionsCard extends StatelessWidget {
  final String option;
  final Color color;

  const OptionsCard({
    Key? key,
    required this.option,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Container(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Image.asset(
              ('assets/images/$option.png'),
              width: 40.0, // Scaled down 
              height: 40.0, // Scaled down
            ),
          ),
          Text(
            option,
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
