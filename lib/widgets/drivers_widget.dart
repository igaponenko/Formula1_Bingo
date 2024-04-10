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
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white)),
      child: Row(
        children: [
          Text(
              // 'Driver ${driverIndex + 1}: $driver / $totalDrivers drivers',
              driver,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'Formula1',
              )),
          const Spacer(),
          Text('${totalDrivers - driverIndex - 1} remaining',
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Formula1',
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
