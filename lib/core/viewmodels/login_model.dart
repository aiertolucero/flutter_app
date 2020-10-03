import 'dart:async';

import 'package:aierto_test/core/models/user.dart';
import 'package:aierto_test/core/models/viewstate.dart';
import 'package:aierto_test/core/services/authentication_service.dart';
import 'package:aierto_test/locator.dart';

import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  User _currentUser;

  Future<User> login() async {
    setState(ViewState.Busy);

    _currentUser = await _authenticationService.login();

    setState(ViewState.Idle);

    return _currentUser;
  }
}
