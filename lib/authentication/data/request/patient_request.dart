// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class PatientSignUpRequest extends Equatable {
  String name;
  String password;
  String email;
  String passwordConfirm;

  @override
  List<Object> get props => [
        name,
        password,
        email,
        passwordConfirm,
      ];

  PatientSignUpRequest(
    this.name,
    this.password,
    this.email,
    this.passwordConfirm,
  );
}
