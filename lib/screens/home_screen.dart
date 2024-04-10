// ignore_for_file: library_private_types_in_public_api

import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import '../constants.dart';
import '../models/driver_model.dart';
import '../widgets/drivers_widget.dart';
import '../widgets/skip_button.dart';
import '../widgets/options_card.dart';
import '../widgets/result_box.dart';
import '../models/db_connect.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = DBconnect();
  late Future _drivers;

  Future<List<Driver>> getDrivers() async {
    return db.fetchDrivers();
  }

  @override
  void initState() {
    _drivers = getDrivers();
    super.initState();
  }

  int index = 0;
  bool isNewRound = false;
  int score = 0;
  bool screenState = true;

  List<bool> cellStatus = List.generate(16, (index) => false);
  List<bool> cellPressed = List.generate(16, (index) => false);
  List<String> cellColor = List.generate(16, (index) => '255,219,225,253');

  void screenOn() {
    setState(() {
      screenState = true;
    });
  }

  void screenOff() {
    setState(() {
      screenState = false;
    });
  }

  void answerCheckUpdate(bool value, int cell) {
    if (cellPressed[cell]) {
      return;
    }
    setState(() {
      isNewRound = false;
      cellPressed[cell] = true;
    });
    if (cellStatus[cell] == false) {
      setState(() {
        cellStatus[cell] = true;
      });
    }
    // for (int i = 0; i < cellStatus.length; i++) { // for testing
    //   print(cellStatus[i]);
    // }
    if (value) {
      setState(() {
        score++;
        cellColor[cell] = '255,128,214,131';
      });
    } else if (!value) {
      setState(() {
        cellColor[cell] = '255,212,75,75';
      });
    }
  }

  void skipDriver(int driverLength) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (index == driverLength - 1) {
        showDialog(
            context: context,
            barrierDismissible:
                false, // disables the functionality of tapping outside the dialog box to close it
            builder: (ctx) => ResultBox(
                  result: score,
                  drivers: driverLength,
                  onPress: startOver,
                ));
      } else {
        setState(() {
          index++;
        });
      }
      screenOn();
    });
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isNewRound = true;
      for (int i = 0; i < 16; i++) {
        cellPressed[i] = false;
        cellStatus[i] = false;
        cellColor[i] = '255,219,225,253';
      }
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _drivers as Future<List<Driver>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Driver>;
            return Stack(
              children: [
                Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'F1 Bingo',
                      style: TextStyle(
                        color: red,
                        fontFamily: 'Formula1',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    backgroundColor: appBackground,
                    // actions: [
                    //   Padding(
                    //     padding: const EdgeInsets.all(18.0),
                    //     child: Text(
                    //       'Score: $score',
                    //       style: const TextStyle(
                    //         fontSize: 18.0,
                    //         color: Colors.grey,
                    //       ),
                    //     ),
                    //   ),
                    // ],
                  ),
                  body: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: appBackground,
                    child: Column(
                      children: [
                        DriversWidget(
                          driver: extractedData[index].name,
                          driverIndex: index,
                          totalDrivers: extractedData.length,
                        ),
                        //const Divider(color: Colors.white),
                        const SizedBox(height: 25.0),
                        Flexible(
                          child: GridView.count(
                            crossAxisCount: 4,
                            children: List.generate(
                              extractedData[index].options.length,
                              (i) => GestureDetector(
                                onTap: () {
                                  screenOff();
                                  answerCheckUpdate(
                                      extractedData[index]
                                          .options
                                          .values
                                          .toList()[i],
                                      i);
                                  skipDriver(extractedData.length);
                                },
                                child: OptionsCard(
                                  option: extractedData[index]
                                      .options
                                      .keys
                                      .toList()[i],
                                  color: isNewRound == false
                                      ? cellColor[i] == '255,219,225,253'
                                          ? cellStatus[i]
                                              ? extractedData[index]
                                                          .options
                                                          .values
                                                          .toList()[i] ==
                                                      true
                                                  ? correct
                                                  : incorrect
                                              : background
                                          : Color.fromARGB(
                                              int.parse(
                                                  cellColor[i].split(',')[0]),
                                              int.parse(
                                                  cellColor[i].split(',')[1]),
                                              int.parse(
                                                  cellColor[i].split(',')[2]),
                                              int.parse(
                                                  cellColor[i].split(',')[3]),
                                            )
                                      : background,
                                  index: extractedData[index]
                                      .options
                                      .keys
                                      .toList()
                                      .asMap()
                                      .keys
                                      .toList()[i],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: GestureDetector(
                    onTap: () => skipDriver(extractedData.length),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: SkipButton(),
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                ),
                if (!screenState)
                  const ModalBarrier(
                    // color: Colors.black.withOpacity(0.5),
                    dismissible: false, // ignores clicking
                  ),
              ],
            );
          }
        } else {
          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20.0),
                  Text(
                    'Please wait while bingo is loading..',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.none,
                      fontSize: 14.0,
                    ),
                  ),
                ]),
          );
        }
        return const Center(
          child: Text('No data'),
        );
      },
    );
  }
}
