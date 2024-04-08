import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  final int result;
  final int drivers;
  final VoidCallback onPress;

  const ResultBox({
    super.key,
    required this.result,
    required this.drivers,
    required this.onPress,
  });

  //   const ResultBox({Key? key, required this.result, required this.drivers, required this.onPress, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Score',
                style: TextStyle(fontSize: 22.0),
              ),
              const SizedBox(height: 20.0),
              CircleAvatar(
                radius: 70.0,
                backgroundColor: result == drivers / 2
                    ? Colors.yellow // when the result is half the questions
                    : result < drivers / 2
                        ? incorrect // when the result is less than half the questions
                        : correct,
                child: Text(
                  '$result/$drivers',
                  style: const TextStyle(fontSize: 30.0),
                ), // when the result is more than half the questions
              ),
              const SizedBox(height: 20.0),
              Text(
                result == drivers / 2
                    ? 'Almost there' // when the result is half the questions
                    : result < drivers / 2
                        ? 'Try again?' // when the result is less than half the questions
                        : 'Good job!', // when the result is more than half the questions)
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 25.0),
              GestureDetector(
                  onTap: onPress,
                  child: const Text('Start Over',
                      style: TextStyle(
                          color: Color.fromARGB(255, 70, 14, 255),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,)))
            ],
          )),
    );
  }
}
