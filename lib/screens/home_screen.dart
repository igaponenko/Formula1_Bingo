import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/driver_model.dart';
import '../widgets/drivers_widget.dart';
import '../widgets/skip_button.dart';
import '../widgets/options_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> cellColors = List<Color>.generate(16, (index) => Colors.blue);
  List<Driver> _drivers = [
    Driver(id: '1', name: 'Max Verstappen', options: {
      '1': true,
      '2': false,
      '3': false,
      '4': false,
      '5': true,
      '6': false,
      '7': false,
      '8': false,
      '9': false,
      '10': false,
      '11': false,
      '12': false,
      '13': false,
      '14': false,
      '15': false,
      '16': false,
    }),
    Driver(id: '2', name: 'Lewis Hamilton', options: {
      '1': false,
      '2': true,
      '3': false,
      '4': false,
      '5': true,
      '6': false,
      '7': false,
      '8': false,
      '9': false,
      '10': false,
      '11': false,
      '12': false,
      '13': false,
      '14': false,
      '15': false,
      '16': false,
    }),
  ];

  int index = 0;

  void skipDriver() {
    if (index == _drivers.length - 1) {
      return;
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('F1 Bingo'),
        backgroundColor: background,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            DriversWidget(
              driver: _drivers[index].name,
              driverIndex: index,
              totalDrivers: _drivers.length,
            ),
            const Divider(color: normal),
            const SizedBox(height: 25.0),
            Flexible (
              child: OptionsCard(
                onTap: (index) {
                  setState(() {
                    cellColors[index] = Colors.red;
                  });
                },
                cellColors: cellColors,
              )
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SkipButton(
          skipDriver: skipDriver,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
