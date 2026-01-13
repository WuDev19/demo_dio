import 'package:demo_dio/statemanagement/state/ResponseStatus.dart';

class ResponseSuccess<T> extends ResponseStatus {
  final T data;
  ResponseSuccess(this.data);
}