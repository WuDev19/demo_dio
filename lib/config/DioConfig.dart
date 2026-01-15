import 'package:demo_dio/model/response/Product.dart';
import 'package:dio/dio.dart';

/*
handler.next(): cho request đi tiếp
handler.resolve(): ép request thành công
+ Gọi trong onRequest: ko gọi http đến server nữa, nhảy vào onResponse với Response mình tạo, code phía sau vẫn chạy
+ Gọi trong onResponse: thay thế thành Response mình tạo, ko lấy response của server nữa, code phía sau vẫn chạy
+ Gọi trong onError: chuyển từ lỗi sang thành công, sẽ nhảy vào onResponse với Response mà mình tạo, code phía sau vẫn chạy
handler.reject(): ép request lỗi
+ Gọi trong onRequest: ko gọi http đến server nữa, nhảy vào onError với Exception mình tạo, code phía sau vẫn chạy
+ Gọi trong onResponse: chuyển từ thành công sang lỗi, nhảy vào onError với Exception mình tạo, code phía sau vẫn chạy
+ Gọi trong onError: thay thế thành lỗi của mình tạo, ko lấy của server nữa, code phía sau vẫn chạy

InterceptorsWrapper: có thể được thực hiện đồng thời, nghĩa là tất cả các yêu cầu nhập vào trình chặn cùng một lúc, thay vì thực hiện tuần tự
QueuedInterceptorsWrapper: cung cấp cơ chế truy cập tuần tự (từng cái một) cho các thiết bị chặn, 3 cái thì mỗi cái có 1 queue riêng
*/
class DioConfig {
  final Dio dio;

  DioConfig()
    : dio = Dio(
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
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //thực thi trước khi gửi request cho server
          print("hehe ${options.path} va ${options.queryParameters}");
          if (options.path == "product/get/all") {
            handler.reject(
              DioException(
                requestOptions: options,
                message: "Permission denied",
              ),
            );
            print("onRequest 1");
          } else if (options.path == "product/${options.data}") {
            handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: "Success",
              ),
            );
            print("onRequest 2");
          } else {
            handler.next(options);
            print("onRequest 3");
          }
          print("onRequest 4");
        },
        onResponse: (response, handler) {
          //thực thi trước khi gửi response cho client
          print("onResponse trước");
          if (response.data is Product) {
            handler.reject(
              DioException(
                requestOptions: RequestOptions(),
                message: "Bad request",
              ),
            );
            print("onResponse trong1");
          } else {
            print("onResponse trong2");
            handler.next(response);
          }
          print("onResponse sau");
        },
        onError: (error, handler) {
          //thực thi trước khi ném lỗi cho client
          print("hehehe ${error.error}");
          handler.next(error);
        },
      ),
    );
  }
}
