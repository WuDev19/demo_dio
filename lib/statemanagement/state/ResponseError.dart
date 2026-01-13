import 'package:demo_dio/statemanagement/state/ResponseStatus.dart';

class ResponseError extends ResponseStatus {
  final Exception e;

  ResponseError(this.e) ;

}
