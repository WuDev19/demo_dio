import 'package:dio/dio.dart';

class DioConfig {
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8080/api/",
      connectTimeout: const Duration(seconds: 30),
      //thời gian tối đa để kết nối đến server, nếu sau n giây ko kết nối được thì ném ra exception
      receiveTimeout: const Duration(seconds: 30),
      //thời gian tối đa chờ server trả kết quả sau khi đã kết nối thành công
      sendTimeout: const Duration(seconds: 30),
      //thời gian tối đa để gửi dữ liệu lên server
      headers: {"Content-Type": "application/json"},
    ),
  );
}
