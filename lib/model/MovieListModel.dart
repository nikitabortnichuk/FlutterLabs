import 'package:chwitter/di/DI.dart';
import 'package:chwitter/model/Movie.dart';
import 'package:flutter/foundation.dart';

class MovieListModel extends ChangeNotifier {
  List<Movie> _items;

  MovieListModel() {
    _items = [];
  }

  MovieListModel.fromJson(dynamic json) {
    if (json["results"] != null) {
      _items = [];
      json["results"].forEach((v) {
        _items.add(Movie.fromJson(v));
      });
    }
  }

  List<Movie> get items => _items;

  set items(value) {
    items = value;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_items != null) {
      map["items"] = _items.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Movie getById(int id) {
    return items[id];
  }

  getData() async {
    _items = await DI.movieRemoteDataSource.getItems();
    notifyListeners();
  }
}
