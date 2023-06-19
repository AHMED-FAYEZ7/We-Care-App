// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/base_response.dart';

part 'doctor_response.g.dart';

@JsonSerializable()
class DoctorAuthResponse extends BaseResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserResponse? user;

  DoctorAuthResponse(
    super.status,
    super.message,
    this.token,
    this.user,
  );

  factory DoctorAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorAuthResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DoctorAuthResponseToJson(this);
}
