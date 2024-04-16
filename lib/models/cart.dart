import 'package:flutter/foundation.dart';
import 'package:flutter_learn/models/catelog.dart';

class CartModel extends ChangeNotifier {
  late CatelogModel _catelog;
  final List<int> _itemIds = [];
  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel newCatelog) {
    _catelog = newCatelog;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
