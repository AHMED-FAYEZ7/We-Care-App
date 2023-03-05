import 'package:equatable/equatable.dart';
import 'package:health_care/core/error/error_handler.dart';

class Failure extends Equatable {
  int code;
  String message;

  Failure(this.code, this.message);

  @override
  List<Object> get props => [];
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}
