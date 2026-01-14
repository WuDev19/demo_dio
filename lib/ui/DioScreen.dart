import 'package:demo_dio/config/DioConfig.dart';
import 'package:demo_dio/model/response/Product.dart';
import 'package:demo_dio/repository/base/ProductRepository.dart';
import 'package:demo_dio/repository/impl/ProductRepositoryImpl.dart';
import 'package:demo_dio/statemanagement/cubit/ProductCubit.dart';
import 'package:demo_dio/statemanagement/state/ResponseError.dart';
import 'package:demo_dio/statemanagement/state/ResponseLoading.dart';
import 'package:demo_dio/statemanagement/state/ResponseStatus.dart';
import 'package:demo_dio/statemanagement/state/ResponseSuccess.dart';
import 'package:demo_dio/ui/AllProductScreen.dart';
import 'package:demo_dio/model/request/ProductRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DioScreen extends StatefulWidget {
  const DioScreen({super.key});

  @override
  State<DioScreen> createState() => _DioScreenState();
}

class _DioScreenState extends State<DioScreen> {
  final idController = TextEditingController();

  final nameController = TextEditingController();

  final giaController = TextEditingController();

  final motaController = TextEditingController();

  final thumbnailController = TextEditingController();

  final giamGiaController = TextEditingController();

  late final ProductRepository productRepository;

  late final ProductCubit productCubit;

  late final Dio dio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dio = DioConfig().dio;
    productRepository = ProductRepositoryImpl(dio);
    productCubit = ProductCubit(ResponseStatus(), repo: productRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => productCubit,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap id san pham: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: idController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap ten nguoi ban: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap gia san pham: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: giaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap mo ta san pham: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: motaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap link anh thumbnail: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: thumbnailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhap giam gia: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: giamGiaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 100,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  // childAspectRatio: 2 //tỉ lệ width / height
                  mainAxisExtent: 40,
                ),
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      String ten = nameController.text;
                      int gia = int.parse(giaController.text);
                      String mota = motaController.text;
                      String thumbnail = thumbnailController.text;
                      int giamGia = int.parse(giamGiaController.text);
                      final pr = ProductRequest(
                        tenNguoiBan: ten,
                        giaSp: gia,
                        motaSp: mota,
                        thumbnail: thumbnail,
                        giamgia: giamGia,
                      );
                      productCubit.postProduct(pr);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    child: Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String ten = nameController.text;
                      int gia = int.parse(giaController.text);
                      String mota = motaController.text;
                      String thumbnail = thumbnailController.text;
                      int giamGia = int.parse(giamGiaController.text);
                      final pr = ProductRequest(
                        tenNguoiBan: ten,
                        giaSp: gia,
                        motaSp: mota,
                        thumbnail: thumbnail,
                        giamgia: giamGia,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                    ),
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
                    ),
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("data")));
                      String ten = nameController.text;
                      int gia = int.parse(giaController.text);
                      String mota = motaController.text;
                      String thumbnail = thumbnailController.text;
                      int giamGia = int.parse(giamGiaController.text);
                      print("$ten + $gia");
                      final pr = ProductRequest(
                        tenNguoiBan: ten,
                        giaSp: gia,
                        motaSp: mota,
                        thumbnail: thumbnail,
                        giamgia: giamGia,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                    ),
                    child: Text("Patch", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AllProductScreen()),
                );
                productCubit.getProduct(int.parse(idController.text));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
              ),
              child: Text("Get", style: TextStyle(color: Colors.black)),
            ),
            BlocListener<ProductCubit, ResponseStatus>(
              //nếu ko trả về view thì dùng listener, ví dụ như chỉ cần show snackbar khi lỗi
              //nếu cần hiện lên view khi lỗi thì trả về trong builder
              listenWhen: (previous, current) => current is ResponseError,
              listener: (BuildContext context, ResponseStatus state) {
                if (state is ResponseError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.e.toString())));
                }
              },
              child: BlocBuilder<ProductCubit, ResponseStatus>(
                buildWhen: (previous, current) =>
                    current is ResponseSuccess<Product> ||
                    current is ResponseLoading,
                builder: (BuildContext context, ResponseStatus state) {
                  if (state is ResponseLoading) {
                    print("loadind");
                    return CircularProgressIndicator();
                  }
                  if (state is ResponseSuccess) {
                    final data = state.data as Product;
                    print(data);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          data.thumbnail,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset("assets/images/icon_avatar.png"),
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        Text(data.motaSp, style: TextStyle(color: Colors.cyan)),
                      ],
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
