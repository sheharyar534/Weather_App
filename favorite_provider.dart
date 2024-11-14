import 'package:flutter/foundation.dart';

class FavoriteItemProvider with ChangeNotifier {
  List<int> _favItem = [];

  List<int> get favItem => _favItem;

  void addFavorite(int value) {
    _favItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    favItem.remove(value);
    notifyListeners();
  }
}
