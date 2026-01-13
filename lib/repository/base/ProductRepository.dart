import 'package:demo_dio/model/response/Product.dart';

abstract class ProductRepository{
  Future<List<Product>> getProducts();

}