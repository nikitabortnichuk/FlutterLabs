
import 'package:chwitter/model/ChweetModel.dart';
import 'package:flutter/foundation.dart';

class LikedChweetListModel extends ChangeNotifier{
  final List<ChweetModel> items;

  LikedChweetListModel({this.items});

  void addToLiked(ChweetModel item) {
    items.add(item);
    notifyListeners();
  }

  void removeFromLiked(ChweetModel item) {
    items.add(item);
    notifyListeners();
  }

  void clearLiked() {
    items.clear();
    notifyListeners();
  }
}