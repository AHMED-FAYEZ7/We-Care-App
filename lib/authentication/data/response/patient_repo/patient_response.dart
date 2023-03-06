// ignore_for_file: depend_on_referenced_packages

import 'package:health_care/core/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_response.g.dart';

@JsonSerializable()
class PatientUserResponse {
  @JsonKey(name: "appointments")
  List<String>? appointments;
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
  @JsonKey(name: "Patient")
  String? type;
  @JsonKey(name: "username")
  String? userName;
  @JsonKey(name: "__v")
  String? v;

  PatientUserResponse(this.appointments, this.id, this.name, this.email,
      this.confirmed, this.active, this.type, this.userName, this.v);

  factory PatientUserResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatientUserResponseToJson(this);
}

@JsonSerializable()
class PatientDataResponse {
  @JsonKey(name: "user")
  PatientUserResponse? user;

  PatientDataResponse(this.user);

  factory PatientDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatientDataResponseToJson(this);
}

@JsonSerializable()
class PatientAuthResponse extends BaseResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "data")
  PatientDataResponse? data;

  PatientAuthResponse(super.status, super.message, this.token, this.data);

  @override
  Map<String, dynamic> toJson() => _$PatientAuthResponseToJson(this);

  factory PatientAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientAuthResponseFromJson(json);
}
