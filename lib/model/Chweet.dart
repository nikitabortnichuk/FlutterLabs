
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chweet extends ChangeNotifier{
  String _name;
  String _account;
  bool _verified;
  String _image;
  String _message;
  String _media;
  int _rechweet;
  int _fav;
  bool _isLiked = false;
  Color _textStyle = Colors.black;


  String get name => _name;

  String get account => _account;
  bool get verified => _verified;
  String get image => _image;
  String get message => _message;
  String get media => _media;
  int get rechweet => _rechweet;
  int get fav => _fav;
  bool get isLiked => _isLiked;
  Color get textStyle => _textStyle;

  set fav(int value) {
    _fav = value;
    notifyListeners();
  }

  set isLiked(bool value) {
    _isLiked = value;
    notifyListeners();
  }

  set textStyle(Color value) {
    _textStyle = value;
    notifyListeners();
  }

  Chweet({
    String name,
    String account,
    bool verified,
    String image,
    String message,
    String media,
    int rechweet,
    int fav,
    textStyle}){
    _name = name;
    _account = account;
    _verified = verified;
    _image = image;
    _message = message;
    _media = media;
    _rechweet = rechweet;
    _fav = fav;
    _textStyle = textStyle;
  }

  Chweet.fromJson(dynamic json) {
    _name = json["name"];
    _account = json["account"];
    _verified = json["verified"];
    _image = json["image"];
    _message = json["message"];
    _media = json["media"];
    _rechweet = json["rechweet"];
    _fav = json["fav"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["account"] = _account;
    map["verified"] = _verified;
    map["image"] = _image;
    map["message"] = _message;
    map["media"] = _media;
    map["rechweet"] = _rechweet;
    map["fav"] = _fav;
    return map;
  }

}