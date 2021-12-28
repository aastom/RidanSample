import 'package:flutter/material.dart';
import 'package:ridan_sample/models/products.dart';

class CartManager with ChangeNotifier {
  late List<Products> _carts;

  List<Products> get carts => _carts;

  addToCart(Products product) {
    this._carts.add(product);
    notifyListeners();
  }

   CartManager() {
   
    _carts = <Products>[];
    
   
  }
}
