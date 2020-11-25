import 'package:chwitter/model/Chweet.dart';

class ChweetResponse {
  List<Chweet> _items;

  List<Chweet> get items => _items;

  ChweetResponse({
      List<Chweet> items}){
    _items = items;
}

  ChweetResponse.fromJson(dynamic json) {
    if (json["items"] != null) {
      _items = [];
      json["items"].forEach((v) {
        _items.add(Chweet.fromJson(v));
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