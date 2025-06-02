// lib/providers/cart_provider.dart
import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => [..._items]; // Retorna uma cópia da lista

  int get itemCount => _items.length;

  double get totalPrice {
    double total = 0.0;
    for (var item in _items) {
      total += item.preco;
    }
    return total;
  }

  void addItem(Product product) {
    _items.add(product);
    notifyListeners(); // Notifica os widgets que estão ouvindo
  }

  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}