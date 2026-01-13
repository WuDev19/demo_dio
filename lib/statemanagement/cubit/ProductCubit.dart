import 'package:demo_dio/statemanagement/state/ResponseError.dart';
import 'package:demo_dio/statemanagement/state/ResponseLoading.dart';
import 'package:demo_dio/statemanagement/state/ResponseStatus.dart';
import 'package:demo_dio/statemanagement/state/ResponseSuccess.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/base/ProductRepository.dart';

class ProductCubit extends Cubit<ResponseStatus> {
  final ProductRepository repo;

  ProductCubit(super.initialState, {required this.repo});

  void getProducts() async{
    emit(ResponseLoading());
    try {
      final products = await repo.getProducts();
      emit(ResponseSuccess(products));
    } on Exception catch (e) {
      emit(ResponseError(e));
    }
  }
}
