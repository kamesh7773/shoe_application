import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  // List of Map of product
  List<Map<String, dynamic>> cart = [];

  // add to cart method
  void addToCart(product) {
    cart.add(product);
    notifyListeners();
  }

  // add to cart method
  void removeFromCart(product) {
    cart.removeAt(product);
    debugPrint(product.toString());
    notifyListeners();
  }
}
