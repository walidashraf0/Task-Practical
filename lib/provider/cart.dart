import 'package:flutter/material.dart';

import 'package:plant/models/item.dart';

class Cart with ChangeNotifier {
  List<Item> selectProducts = [];
  int price = 0;

  void add(Item product) {
    selectProducts.add(product);
    price += product.price.round();
    notifyListeners();
  }

  void remove(Item product) {
    selectProducts.remove(product);
    price -= product.price.round();
    notifyListeners();
  }
}
