import 'package:flutter/material.dart';
import 'package:sotre_app/models/product_model.dart';
import 'package:sotre_app/models/cart_model.dart';

/* Cart Provider*/
class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Product product) {
    /*Check if product already exists*/
    final index = _items.indexWhere((item) => item.id == product.id);

    if (index >= 0) {
      // Optional: increase quantity or ignore
      // For now, we'll ignore duplicates
      return;
    }

    _items.add(
      CartItem(
        id: product.id,
        title: product.title,
        price: product.price,
        image: product.image,
      ),
    );

    notifyListeners();
  }

  void removeFromCart(int productId) {
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
