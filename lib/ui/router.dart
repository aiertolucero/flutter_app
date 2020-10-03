import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './views/login_view.dart';
import './views/profile_view.dart';
import './views/weather_view.dart';

const String initialRoute = "login";

class ViewRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'profile':
        return MaterialPageRoute(builder: (_) => ProfileView());
      case 'weather':
        return MaterialPageRoute(builder: (_) => WeatherView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
