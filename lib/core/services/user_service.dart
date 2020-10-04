import 'dart:async';
import 'dart:convert';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

const AUTH0_DOMAIN = 'dev-vz41hqdc.us.auth0.com';
const AUTH0_CLIENT_ID = '7bGyA0CaH0DzHl8NbrMirdzqU3FRWiJk';

const AUTH0_REDIRECT_URI = 'com.auth0.flutterdemo://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

class UserService {
  StreamController<User> userController = StreamController<User>();

  final FlutterAppAuth appAuth = FlutterAppAuth();

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  User user;

  Future<Map> getUserDetails(String accessToken) async {
    final url = 'https://$AUTH0_DOMAIN/userinfo';
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }

  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<User> login() async {
    try {
      final AuthorizationTokenResponse result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(AUTH0_CLIENT_ID, AUTH0_REDIRECT_URI,
            issuer: 'https://$AUTH0_DOMAIN',
            scopes: [
              'openid',
              'profile',
              'offline_access'
            ],
            promptValues: [
              'login'
            ] // ignore any existing session; force interactive login prompt
            ),
      );

      // final idToken = parseIdToken(result.idToken);
      final profile = await getUserDetails(result.accessToken);
      final position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      userController.add(
        User(
            name: profile['name'],
            picture: profile['picture'],
            gitUrl: 'https://github.com/' + profile['nickname'],
            location: '${position.latitude}, ${position.longitude}'),
      );

      // User.setProfile(profile);

      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);

      return User(
          name: profile['name'],
          picture: profile['picture'],
          gitUrl: 'https://github.com/' + profile['nickname'],
          location: '${position.latitude}, ${position.longitude}');
    } catch (e) {
      return null;
    }
  }
}
