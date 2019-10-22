import 'package:flutter/foundation.dart';

class Cartitem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  Cartitem(
    {
      this.id,
      this.title,
      this.quantity,
      this.price
    }
  );
}

class Cart with ChangeNotifier{
  Map<String, Cartitem> _items;

  Map<String, Cartitem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if(_items.containsKey(productId)) {
      //
      _items.update(productId, (existing) => Cartitem(id: existing.id, price: existing.price, quantity: existing.quantity + 1));
    }
    else {
      //
      _items.putIfAbsent(productId, () => Cartitem(id: DateTime.now().toString(), title: title, price: price));
    }
  }
}