import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String name;
  String picture;
  String gitUrl;
  User({this.name, this.picture, this.gitUrl});

  User.initial()
      : name = '',
        picture = '',
        gitUrl = '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['gitUrl'] = this.gitUrl;
    return data;
  }
}
