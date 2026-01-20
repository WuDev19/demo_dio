
import 'package:demo_dio/model/request/ProductRequest.dart';
import 'package:demo_dio/model/response/Product.dart';
import 'package:demo_dio/repository/base/ProductRepository.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImpl implements ProductRepository {
  late final Dio _dio;

  ProductRepositoryImpl(this._dio);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get("product/get/all");
      final List<dynamic> dataResponse =
          response.data; //ép về List<dynamic> mới map được
      return dataResponse.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          rethrow;
        case DioExceptionType.badResponse:
          rethrow;
        case DioExceptionType.cancel:
          rethrow;
        default:
          throw Exception("Lỗi không xác định");
      }
    }
  }

  @override
  Future<Product> getProduct(int id) async {
    try {
      final response = await _dio.get("product/$id");
      final data = response.data;
      return Product.fromJson(data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<Product> postProduct(ProductRequest productRequest) async {
    try{
      final response = await _dio.post("/product/create", data: productRequest.toJson());
      return Product.fromJson(response.data);
    } on DioException{
      rethrow;
    }
  }

}
