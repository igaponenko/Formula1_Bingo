import 'package:flutter/material.dart';
import './models/driver_model.dart';
import './screens/home_screen.dart';
import './models/db_connect.dart';

void main() {
  var db = DBconnect();
  // db.addDriver(
  //   Driver(
  //     id: '1',
  //     name: 'Max Verstappen',
  //     options: {
  //       '1': true,
  //       '2': false,
  //       '3': false,
  //       '4': false,
  //       '5': true,
  //       '6': false,
  //       '7': false,
  //       '8': false,
  //     }
  //   )
  // );
  db.fetchDrivers(); 


  runApp(
    const MyApp(),
  );
} 

class MyApp extends StatelessWidget {
  // constructor for MyApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}