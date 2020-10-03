import 'package:aierto_test/core/viewmodels/navbar_model.dart';
import 'package:aierto_test/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, 'profile');
          break;
        case 1:
          Navigator.pushNamed(context, 'weather');
          break;
      }
    }

    return BaseView<NavbarModel>(
        builder: (context, model, child) => BottomNavigationBar(
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
                selectedItemColor: Colors.grey[600],
                onTap: (index) => _onItemTapped(index)));
  }
}
