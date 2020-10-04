import 'package:aierto_test/core/models/viewstate.dart';
import 'package:aierto_test/core/viewmodels/weather_model.dart';
import 'package:aierto_test/ui/views/base_view.dart';
import 'package:aierto_test/ui/widgets/navbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:intl/intl.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentDateTime = DateFormat("MM/dd/yyyy").format(DateTime.now());
    return BaseView<WeatherModel>(
        onModelReady: (model) => model.getForeCast(),
        builder: (context, model, child) => Scaffold(
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : BootstrapContainer(children: <Widget>[
                    BootstrapRow(height: 100, children: <BootstrapCol>[
                      BootstrapCol(
                        sizes: 'col-sm-6 col-md-2',
                        child: ContentWidget(text: 'Date(mm/dd/yyyy)'),
                      ),
                      BootstrapCol(
                        sizes: 'col-sm-6 col-md-2',
                        child: ContentWidget(text: 'Temp(F)'),
                      ),
                      BootstrapCol(
                        sizes: 'col-md-2',
                        invisibleForSizes: 'xs',
                        child: ContentWidget(text: 'Description'),
                      ),
                      BootstrapCol(
                        sizes: 'col-md-2',
                        invisibleForSizes: 'xs',
                        child: ContentWidget(text: 'Main'),
                      ),
                      BootstrapCol(
                        sizes: 'col-md-2',
                        invisibleForSizes: 'xs',
                        child: ContentWidget(text: 'Pressure'),
                      ),
                      BootstrapCol(
                        sizes: 'col-md-2',
                        invisibleForSizes: 'xs',
                        child: ContentWidget(text: 'Humidity'),
                      )
                    ]),
                    BootstrapRow(height: 100, children: <BootstrapCol>[
                      BootstrapCol(
                        sizes: 'col-sm-6 col-md-2',
                        child: ContentWidget(text: '$currentDateTime'),
                      ),
                      BootstrapCol(
                        sizes: 'col-sm-6 col-md-2',
                        child: ContentWidget(text: model.forecast.temp),
                      ),
                      BootstrapCol(
                        sizes: 'col-md-2',
                        invisibleForSizes: 'xs',
                        child: ContentWidget(text: model.forecast.description),
                      ),
                      BootstrapCol(
                        sizes: 'col-md-2',
                        invisibleForSizes: 'xs',
                        child: ContentWidget(text: model.forecast.main),
                      ),
                      BootstrapCol(
                        sizes: 'col-md-2',
                        invisibleForSizes: 'xs',
                        child: ContentWidget(text: model.forecast.pressure),
                      ),
                      BootstrapCol(
                        sizes: 'col-md-2',
                        invisibleForSizes: 'xs',
                        child: ContentWidget(text: model.forecast.humidity),
                      )
                    ])
                  ]),
            bottomNavigationBar: Navbar()));
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key key,
    this.text,
    this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      color: color,
      child: Text(text),
    );
  }
}
