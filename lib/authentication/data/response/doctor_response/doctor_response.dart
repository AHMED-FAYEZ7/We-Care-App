// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/base_response.dart';

part 'doctor_response.g.dart';

@JsonSerializable()
class DoctorUserResponse {
  @JsonKey(name: "specialization")
  String? specialization;
  @JsonKey(name: "fees")
  int? fees;
  @JsonKey(name: "timePerPatient")
  int? timePerPatient;
  @JsonKey(name: "timeTable")
  List<String>? timeTable;
  @JsonKey(name: "patients")
  List<String>? patients;
  @JsonKey(name: "appointments")
  List<String>? appointments;
  @JsonKey(name: "averageRating")
  double? averageRating;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "confirmed")
  bool? confirmed;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "__t")
  String? type;
  @JsonKey(name: "username")
  String? userName;
  @JsonKey(name: "__v")
  int? v;

  DoctorUserResponse(
    this.specialization,
    this.fees,
    this.timePerPatient,
    this.timeTable,
    this.patients,
    this.appointments,
    this.averageRating,
    this.status,
    this.id,
    this.name,
    this.email,
    this.confirmed,
    this.active,
    this.type,
    this.userName,
    this.v,
  );

  factory DoctorUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorUserResponseToJson(this);
}

@JsonSerializable()
class DoctorDataResponse {
  @JsonKey(name: "user")
  DoctorUserResponse? user;

  DoctorDataResponse(this.user);

  factory DoctorDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDataResponseToJson(this);
}

@JsonSerializable()
class DoctorAuthResponse extends BaseResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "data")
  DoctorDataResponse? data;

  DoctorAuthResponse(
    super.status,
    super.message,
    this.token,
    this.data,
  );

  factory DoctorAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorAuthResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DoctorAuthResponseToJson(this);
}
