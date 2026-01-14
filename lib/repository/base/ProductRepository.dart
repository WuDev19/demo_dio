import 'dart:ffi';

import 'package:demo_dio/model/response/Product.dart';

import '../../model/request/ProductRequest.dart';

abstract class ProductRepository{
  Future<List<Product>> getProducts();
  Future<Product> getProduct(int id);
  Future<Product> postProduct(ProductRequest productRequest);
}