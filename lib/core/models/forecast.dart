import 'package:flutter/material.dart';

class ForeCast extends ChangeNotifier {
  String temp;
  String description;
  String main;
  String pressure;
  String humidity;

  ForeCast(
      {this.temp, this.description, this.main, this.pressure, this.humidity});

  ForeCast.fromJson(Map<String, dynamic> json) {
    temp = json['main']['temp'].toString();
    description = json['weather'][0]['description'];
    main = json['weather'][0]['main'];
    pressure = json['main']['pressure'].toString();
    humidity = json['main']['humidity'].toString();
  }
}
