import 'package:chwitter/model/Chweet.dart';
import 'package:flutter/foundation.dart';

class LikedChweetListModel extends ChangeNotifier {
  final List<Chweet> items = [];

  void addToLiked(Chweet item) {
    items.add(item);
    notifyListeners();
  }

  void removeFromLiked(Chweet item) {
    if (item != null) {
      items.remove(item);
    }
    notifyListeners();
  }

  void clearLiked() {
    items.clear();
    notifyListeners();
  }
}
