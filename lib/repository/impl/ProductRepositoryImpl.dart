import 'package:demo_dio/config/DioConfig.dart';
import 'package:demo_dio/model/response/Product.dart';
import 'package:demo_dio/repository/base/ProductRepository.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await DioConfig().dio.get("product/get/all");
      final List<dynamic> dataResponse = response.data; //ép về List<dynamic> mới map được
      print(dataResponse);
      return dataResponse.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          rethrow;
        case DioExceptionType.badResponse:
          print("Lỗi server: ${e.response?.statusCode}");
          rethrow;
        case DioExceptionType.cancel:
          print("Request bị huỷ");
          rethrow;
        default:
          print("Lỗi không xác định");
          throw Exception("Lỗi không xác định");
      }
    }
  }
}
