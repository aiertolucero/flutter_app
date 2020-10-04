import 'dart:async';
import 'dart:convert';

import 'package:aierto_test/core/models/forecast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var client = new http.Client();

  Future<ForeCast> getForeCast() async {
    final position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var response = await client.get(
        'http://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&APPID=849ad8c07c094a2f63d3f9c5314a5311');
    // parse into List
    var parsed = json.decode(response.body);

    return ForeCast.fromJson(parsed);
  }
}
