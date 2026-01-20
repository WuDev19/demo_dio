import 'package:demo_dio/config/DioConfig.dart';
import 'package:demo_dio/model/response/Product.dart';
import 'package:demo_dio/statemanagement/cubit/ProductCubit.dart';
import 'package:demo_dio/statemanagement/state/ResponseError.dart';
import 'package:demo_dio/statemanagement/state/ResponseLoading.dart';
import 'package:demo_dio/statemanagement/state/ResponseStatus.dart';
import 'package:demo_dio/statemanagement/state/ResponseSuccess.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/ui/ProductItem.dart';
import '../repository/base/ProductRepository.dart';
import '../repository/impl/ProductRepositoryImpl.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  late ProductRepository repo;
  late ProductCubit cubit;
  late Dio dio;
  late final ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    dio = DioConfig().dio;
    repo = ProductRepositoryImpl(dio);
    cubit = ProductCubit(ResponseStatus(), repo: repo);
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                cubit.getProducts();
              },
              child: Text("Fetch"),
            ),
            BlocBuilder<ProductCubit, ResponseStatus>(
              bloc: cubit,
              builder: (BuildContext context, ResponseStatus state) {
                if (state is ResponseLoading) {
                  return CircularProgressIndicator();
                }
                if (state is ResponseError) {
                  return ScaffoldMessenger(
                    child: SnackBar(content: Text(state.e.toString())),
                  );
                }
                if (state is ResponseSuccess) {
                  final list = state.data as List<Product>;
                  return Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return ProductItem(
                          product: list[index],
                          onClick: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(list[index].tenNguoiBan),
                                  content: Text(list[index].motaSp),
                                  icon: Image.network(
                                    list[index].thumbnail,
                                    height: 50,
                                    width: 50,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Hide"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Ok"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          onDismiss: (Product product) {
                            list.remove(product);
                            cubit.reloadProducts(list);
                          },
                        );
                      },
                      itemCount: list.length,
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
