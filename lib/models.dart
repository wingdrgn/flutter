import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class CartModel extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}

List<Product> products = [
  Product(name: 'Product 1', price: 10.0),
  Product(name: 'Product 2', price: 20.0),
  Product(name: 'Product 3', price: 30.0),
];
