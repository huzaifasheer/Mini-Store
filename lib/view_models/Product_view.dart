import 'package:flutter/material.dart';
import 'package:sotre_app/Services/Product_Api.dart';
import '../models/product_model.dart';

/* Product provider*/
class ProductViewModel extends ChangeNotifier {
  List<Product> products = [];
  bool isLoading = false;
  String errorMessage = '';

  final ApiService _apiService = ApiService();
  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      products = await _apiService.fetchProducts();

      /* Print each product in console*/
      for (var product in products) {
        print('ID: ${product.id}');
        print('Title: ${product.title}');
        print('Price: ${product.price}');
        print('Image: ${product.image}');
        print('--------------------------');
      }

      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString();
      print('Error fetching products: $errorMessage');
    }

    isLoading = false;
    notifyListeners();
  }
}
