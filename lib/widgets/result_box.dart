import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  final int result;
  final int drivers;
  final int index;
  final VoidCallback onPress;

  const ResultBox({
    super.key,
    required this.result,
    required this.index,
    required this.drivers,
    required this.onPress,
  });

  //   const ResultBox({Key? key, required this.result, required this.drivers, required this.onPress, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: resultsBackground,
      content: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result == drivers
                    ? 'BINGO!' // when the result is half the questions
                    : 'Score', // when the result is more than half the questions)
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Formula1',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              CircleAvatar(
                radius: 60.0,
                backgroundColor: result == 16 || result == drivers
                    ? correct // when the result is half the questions
                    : result <= 16 && result < drivers / 2
                        ? incorrect // when the result is less than half the questions
                        : Colors.yellow,
                child: Text(
                  //'$result/$drivers',
                  '$result',
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Formula1',
                    fontWeight: FontWeight.bold,
                    color: resultsBackground,
                  ),
                ), // when the result is more than half the questions
              ),
              const SizedBox(height: 20.0),
              Text(
                '${index + 1} drivers shown',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Formula1',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50.0),
              GestureDetector(
                  onTap: onPress,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: button,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                      child: Text('Go again',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appBackground,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            fontFamily: 'Formula1',
                          )),
                    ),
                  ))
            ],
          )),
    );
  }
}
