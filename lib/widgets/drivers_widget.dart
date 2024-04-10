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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              // 'Driver ${driverIndex + 1}: $driver / $totalDrivers drivers',
              driver,
              style: const TextStyle(
                fontSize: 18,
                color: normal,
              )
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Text(
              '$totalDrivers remaining',
              style: const TextStyle(
                fontSize: 18,
                color: normal,
              )
            ),
          ),
        ],
      ),
    );
  }
}