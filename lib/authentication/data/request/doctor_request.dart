// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class DoctorSignUpRequest extends Equatable {
  String name;
  String password;
  String email;
  String passwordConfirm;
  String specialization;
  DoctorSignUpRequest(
    this.email,
    this.name,
    this.password,
    this.passwordConfirm,
    this.specialization,
  );

  @override
  List<Object> get props {
    return [
      name,
      password,
      email,
      passwordConfirm,
      specialization,
    ];
  }
}
