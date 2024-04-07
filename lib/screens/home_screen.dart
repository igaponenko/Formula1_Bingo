import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/driver_model.dart';
import '../widgets/drivers_widget.dart';
import '../widgets/skip_button.dart';
import '../widgets/options_card.dart';
import '../widgets/result_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    }),
    Driver(id: '2', name: 'Lewis Hamilton', options: {
      '1': true,
      '2': true,
      '3': false,
      '4': false,
      '5': true,
      '6': false,
      '7': false,
      '8': false,
    }),
  ];

  int index = 0;
  bool isClicked = false;
  int score = 0;
  bool isSelected = false;

  void answerCheckUpdate(bool value) {
    if (isSelected) {
      return;
    } else {
      if (value) {
        score++;
      } 
        setState(() {
          isClicked = true;
          isSelected = true;
        });
      }
  }

  void skipDriver() {
    if (index == _drivers.length - 1) {
      showDialog(
        context: context, 
        barrierDismissible: false, // disables the functionality of tapping outside the dialog box to close it
        builder: (ctx) => ResultBox(
          result: score,
          drivers: _drivers.length,
          onPress: startOver,
        )
      );
    } else {
      setState(() {
        index++;
        isClicked = false;
        isSelected = false;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isClicked = false;
      isSelected = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('F1 Bingo'),
        backgroundColor: background,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
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
            for (int i = 0; i < _drivers[index].options.length; i++)
              GestureDetector(
                onTap: () => answerCheckUpdate(
                    _drivers[index].options.values.toList()[i]),
                child: OptionsCard(
                  option: _drivers[index].options.keys.toList()[i],
                  color: isClicked
                      ? _drivers[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : background,
                ),
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
