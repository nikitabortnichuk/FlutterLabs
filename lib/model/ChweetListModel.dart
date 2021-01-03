import 'package:chwitter/di/DI.dart';
import 'package:chwitter/model/Chweet.dart';
import 'package:flutter/foundation.dart';

class ChweetListModel extends ChangeNotifier {
  List<Chweet> _items;

  ChweetListModel() {
    _items = [];
  }

  ChweetListModel.fromJson(dynamic json) {
    if (json["items"] != null) {
      _items = [];
      json["items"].forEach((v) {
        _items.add(Chweet.fromJson(v));
      });
    }
  }

  List<Chweet> get items => _items;

  set items(value) {
    items = value;
    notifyListeners();
  }

  getData() async {
    _items = await DI.remoteDataSource.getChweets();
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_items != null) {
      map["items"] = _items.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Chweet getById(int id) {
    return items[id];
  }
}
