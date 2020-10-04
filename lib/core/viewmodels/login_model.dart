import 'dart:async';

import 'package:aierto_test/core/models/user.dart';
import 'package:aierto_test/core/models/viewstate.dart';
import 'package:aierto_test/core/services/user_service.dart';
import 'package:aierto_test/locator.dart';

import 'base_model.dart';

class LoginModel extends BaseModel {
  final UserService _userService = locator<UserService>();

  User _currentUser;

  Future<User> login() async {
    setState(ViewState.Busy);

    _currentUser = await _userService.login();

    setState(ViewState.Idle);

    return _currentUser;
  }
}
