import 'package:chwitter/model/ChweetModel.dart';
import 'package:flutter/foundation.dart';

class ChweetListModel extends ChangeNotifier{
  List<ChweetModel> _items;

  List<ChweetModel> get items => _items;

  ChweetListModel({
      List<ChweetModel> items}){
    _items = items;
  }

  ChweetListModel.fromJson(dynamic json) {
    if (json["items"] != null) {
      _items = [];
      json["items"].forEach((v) {
        _items.add(ChweetModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_items != null) {
      map["items"] = _items.map((v) => v.toJson()).toList();
    }
    return map;
  }

}