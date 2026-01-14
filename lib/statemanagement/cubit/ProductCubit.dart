import 'package:demo_dio/model/request/ProductRequest.dart';
import 'package:demo_dio/statemanagement/state/ResponseError.dart';
import 'package:demo_dio/statemanagement/state/ResponseLoading.dart';
import 'package:demo_dio/statemanagement/state/ResponseStatus.dart';
import 'package:demo_dio/statemanagement/state/ResponseSuccess.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/base/ProductRepository.dart';

class ProductCubit extends Cubit<ResponseStatus> {
  late final ProductRepository repo;

  ProductCubit(super.initialState, {required this.repo});

  void getProducts() async {
    emit(ResponseLoading());
    try {
      final data = await repo.getProducts();
      emit(ResponseSuccess(data));
    } on Exception catch (e) {
      emit(ResponseError(e));
    }
  }

  void getProduct(int id) async {
    emit(ResponseLoading());
    try {
      final data = await repo.getProduct(id);
      emit(ResponseSuccess(data));
    } on Exception catch (e) {
      emit(ResponseError(e));
    }
  }

  void postProduct(ProductRequest productRequest) async {
    emit(ResponseLoading());
    try {
      final data = await repo.postProduct(productRequest);
      emit(ResponseSuccess(data));
    } on Exception catch (e) {
      emit(ResponseError(e));
    }
  }
}
