import 'package:aierto_test/core/viewmodels/profile_model.dart';
import 'package:aierto_test/ui/views/base_view.dart';
import 'package:aierto_test/ui/widgets/navbar_view.dart';
import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileModel>(
        builder: (context, model, child) => Scaffold(
            body: Center(
                child: Table(border: TableBorder.all(), children: [
              TableRow(children: [
                Column(children: [Text('Date(mm/dd/yyyy)')]),
                Column(children: [Text('Temp(F)')]),
                Column(children: [Text('Description')]),
                Column(children: [Text('Main')]),
                Column(children: [Text('Pressuer')]),
                Column(children: [Text('Humidity')])
              ])
            ])),
            bottomNavigationBar: Navbar()));
  }
}
