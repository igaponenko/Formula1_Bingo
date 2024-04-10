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
  //       'RedBull': true,
  //       'Sauber': false,
  //       'Mercedes': false,
  //       'McLaren': false,
  //       'Ferrari': false,
  //       'Haas': false,
  //       'VCARB': false,
  //       'Williams': false,
  //       'AstonMartin': false,
  //       'Alpine': false,
  //     }
  //   )
  // );
  // db.addDriver(
  //   Driver(
  //     id: '2',
  //     name: 'Lando Norris',
  //     options: {
  //       'RedBull': false,
  //       'Sauber': false,
  //       'Mercedes': false,
  //       'McLaren': true,
  //       'Ferrari': false,
  //       'Haas': false,
  //       'VCARB': false,
  //       'Williams': false,
  //       'AstonMartin': false,
  //       'Alpine': false,
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