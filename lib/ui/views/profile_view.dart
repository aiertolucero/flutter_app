import 'package:aierto_test/core/models/user.dart';
import 'package:aierto_test/core/viewmodels/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileModel>(
        builder: (context, model, child) => Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 4.0),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          Provider.of<User>(context).picture ?? ''),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Text('Name: ${Provider.of<User>(context).name}'),
                Text('GIT URL: ${Provider.of<User>(context).gitUrl}'),
                SizedBox(height: 48.0),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Logout'),
                ),
              ],
            )),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle_rounded),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.beach_access),
                  label: 'Weather',
                ),
              ],
              selectedItemColor: Colors.amber[800],
            )));
  }
}
