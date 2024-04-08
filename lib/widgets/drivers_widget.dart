import 'package:f1_bingo/constants.dart';
import 'package:flutter/material.dart';

class DriversWidget extends StatelessWidget {
  const DriversWidget(
    {super.key, 
    required this.driver, 
    required this.driverIndex,
    required this.totalDrivers});

  // const DriversWidget({Key? key, required this.driver, required this.driverIndex,required this.totalDrivers}) : super(key: key);

  final String driver;
  final int driverIndex;
  final int totalDrivers;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Driver ${driverIndex + 1}: $driver / $totalDrivers drivers',
        style: const TextStyle(
          fontSize: 18,
          color: normal,
        )
      ),
    );
  }
}