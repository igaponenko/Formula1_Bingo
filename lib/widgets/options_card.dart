import 'package:flutter/material.dart';
import '../constants.dart';

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
    return Card (
      color: color,
      child: ListTile(
        title: Text(
          option, 
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
  













  // Widget build(BuildContext context) {
  //   return GridView.builder(
  //       itemCount: 16,
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 4,
  //       ),
  //       itemBuilder: (_, index) {
  //         return GestureDetector(
  //           onTap: onTap,
  //           child: Card(
  //             color: isClicked 
  //                 ? answers[index] == true
  //                   ? correct
  //                   : incorrect
  //                 : background,
  //             child: Text(
  //               options[index],
  //             ),
  //           ),
  //         );
  //       });
  // }
//}
