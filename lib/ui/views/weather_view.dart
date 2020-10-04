import 'package:aierto_test/core/models/viewstate.dart';
import 'package:aierto_test/core/viewmodels/profile_model.dart';
import 'package:aierto_test/ui/views/base_view.dart';
import 'package:aierto_test/ui/widgets/navbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:intl/intl.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentDateTime = DateFormat("MM/dd/yyyy").format(DateTime.now());
    return BaseView<ProfileModel>(
        onModelReady: (model) => model.getForeCast(),
        builder: (context, model, child) => Scaffold(
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: Table(border: TableBorder.all(), children: [
                    TableRow(children: [
                      Column(children: [Text('Date(mm/dd/yyyy)')]),
                      Column(children: [Text('Temp(F)')]),
                      Column(children: [Text('Description')]),
                      Column(children: [Text('Main')]),
                      Column(children: [Text('Pressuer')]),
                      Column(children: [Text('Humidity')])
                    ]),
                    TableRow(children: [
                      Column(children: [Text('$currentDateTime')]),
                      BootstrapCol(
                          sizes: 'col-12',
                          invisibleForSizes: 'lg',
                          child: Center(child: Text(model.forecast.temp))),
                      Column(children: [Text(model.forecast.description)]),
                      Column(children: [Text(model.forecast.main)]),
                      Column(children: [Text(model.forecast.pressure)]),
                      Column(children: [Text(model.forecast.humidity)])
                    ])
                  ])),
            bottomNavigationBar: Navbar()));
  }
}
