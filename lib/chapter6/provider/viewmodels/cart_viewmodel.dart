import 'package:Flutter_Study/chapter6/provider/repositories/item_list.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';

class CartViewModel extends ChangeNotifier {
  CartViewModel({required repository}) : _repository = repository {
    _items = _repository.items;
  }

  final ItemList _repository;
  final List<Item> _cartItems = [];

  late final List<Item> _items;

  List<Item> get cartItems {
    return _cartItems;
  }

  List<Item> get items {
    return _items;
  }

  int getTotalPrice() {
    int total = 0;
    for (Item item in _items) {
      total += item.price;
    }
    return total;
  }

  void addCart(Item item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void deleteCart(int id) {
    _cartItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
