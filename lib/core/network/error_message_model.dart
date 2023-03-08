// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String status;
  final String message;

  const ErrorMessageModel({
    required this.status,
    required this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      message: json["message"],
      status: json['status'],
    );
  }

  @override
  List<Object> get props => [status, message];
}
