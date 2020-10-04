# Flutter Code Challenge (Ehrlich)
- Using MVVM Architecture with Model Communicating to Services(e.g. AuthService, Api)
- Using Auth0 for social login with Github
- Using api.openweathermap.org to get forecast
## Packages Used
- http - for external requests
- flutter_appauth - for social login
- get_it - for dependency injection
- provider - for sate management
- geolocator - for getting current longtitude and latitude
- intl - for date formats
- flutter_bootstrap - for hiding fields on specific device size
### State Management using Provider
```
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
```
### Service Locator using Get_It
```
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => ApiService());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => NavbarModel());
  locator.registerFactory(() => ProfileModel());
  locator.registerFactory(() => WeatherModel());
}
```
