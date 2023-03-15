// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UserLoginRequest extends Equatable {
  String email;
  String password;

  @override
  List<Object> get props => [
        email,
        password,
      ];

  UserLoginRequest(
    this.email,
    this.password,
  );
}

class UserForgetPasswordRequest extends Equatable {
  String email;

  @override
  List<Object> get props => [
        email,
      ];

  UserForgetPasswordRequest(
    this.email,
  );
}
