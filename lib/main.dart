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
  //       'World_Champion': true,
  //       //'Sauber': false,
  //       'Finland': false,
  //       'Pole_Position': true,
  //       'Mercedes': false,
  //       //'Chinese_GP_Winner': false,
  //       'Latifi_Teammate': true,
  //       'McLaren': false,
  //       'Ferrari': false,
  //       'Podium_Finish': true,
  //       //'Kvyat_Teammate': true,
  //       'Haas': false,
  //       //'VCARB': false,
  //       'Grand_Prix_Winner': true,
  //       'Williams': false,
  //       'No_Drive_Next_Year': false,
  //       'Aston_Martin': false,
  //       'Alpine': false,
  //       'Monza_GP_Winner': true,
  //     }
  //   )
  // );
  // db.addDriver(
  //   Driver(
  //     id: '2',
  //     name: 'Lando Norris',
  //     options: {
  //       'RedBull': true,
  //       'World_Champion': true,
  //       //'Sauber': false,
  //       'Finland': false,
  //       'Pole_Position': true,
  //       'Mercedes': false,
  //       //'Chinese_GP_Winner': false,
  //       'Latifi_Teammate': true,
  //       'McLaren': false,
  //       'Ferrari': false,
  //       'Podium_Finish': true,
  //       //'Kvyat_Teammate': true,
  //       'Haas': false,
  //       //'VCARB': false,
  //       'Grand_Prix_Winner': true,
  //       'Williams': false,
  //       'No_Drive_Next_Year': false,
  //       'Aston_Martin': false,
  //       'Alpine': false,
  //       'Monza_GP_Winner': true,
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