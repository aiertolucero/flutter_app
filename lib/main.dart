import 'package:aierto_test/core/models/user.dart';
import 'package:aierto_test/core/services/user_service.dart';
import 'package:aierto_test/ui/router.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<UserService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: ViewRouter.generateRoute,
      ),
    );
  }
}
