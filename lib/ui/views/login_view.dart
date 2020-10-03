import 'package:aierto_test/core/viewmodels/login_model.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Center(
                      child: Text('Hello World!!',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Open Sans'))),
                  Container(
                      margin:
                          const EdgeInsets.only(top: 10.0, left: 50, right: 50),
                      child: FlatButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () async {
                            var user = await model.login();
                            if (user != null) {
                              Navigator.pushNamed(context, 'profile');
                            }
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Login",
                                ),
                                Icon(
                                  Icons.login,
                                )
                              ])))
                ])));
  }
}
