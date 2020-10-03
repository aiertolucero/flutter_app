import 'package:aierto_test/core/services/api.dart';
import 'package:aierto_test/core/services/authentication_service.dart';
import 'package:aierto_test/core/viewmodels/login_model.dart';
import 'package:aierto_test/core/viewmodels/profile_model.dart';
import 'package:get_it/get_it.dart';

import 'core/viewmodels/navbar_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => NavbarModel());
  locator.registerFactory(() => ProfileModel());
  // locator.registerFactory(() => CommentsModel());
}
