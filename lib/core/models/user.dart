import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String name;
  String picture;
  String gitUrl;
  String location;
  User({this.name, this.picture, this.gitUrl, this.location});

  User.initial()
      : name = '',
        picture = '',
        gitUrl = '',
        location = '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['gitUrl'] = this.gitUrl;
    data['longtitude'] = this.location;
    return data;
  }
}
