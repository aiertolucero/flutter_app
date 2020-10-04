import 'package:aierto_test/core/models/forecast.dart';
import 'package:aierto_test/core/models/viewstate.dart';
import 'package:aierto_test/core/services/api.dart';
import 'package:aierto_test/locator.dart';

import 'base_model.dart';

class WeatherModel extends BaseModel {
  final ApiService _api = locator<ApiService>();
  ForeCast forecast;

  void getForeCast() async {
    setState(ViewState.Busy);

    forecast = await _api.getForeCast();

    setState(ViewState.Idle);
  }
}
