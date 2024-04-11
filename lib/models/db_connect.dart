import 'dart:math';

import 'package:http/http.dart' as http;
import './driver_model.dart';
import 'dart:convert';

class DBconnect {
  final url =
      Uri.parse('https://f1bingo-default-rtdb.firebaseio.com/drivers.json');
  Future<void> addDriver(Driver driver) async {
    http.post(url,
        body: json.encode({
          'name': driver.name,
          'options': driver.options,
        }));
  }

  Future<List<Driver>> fetchDrivers() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Driver> newDrivers = [];
      data.forEach((key, value) {
        var newDriver = Driver(
          id: key,
          name: value['name'],
          options: Map.castFrom(value['options']),
        );
        newDrivers.add(newDriver);
      });
      //newDrivers.shuffle(Random());
      return newDrivers;
    });
  }
}
