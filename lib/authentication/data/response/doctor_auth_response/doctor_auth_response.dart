// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/base_response.dart';

part 'doctor_auth_response.g.dart';

@JsonSerializable()
class ScheduleTimingResponse {
  @JsonKey(name: "start")
  String? start;
  @JsonKey(name: "end")
  String? end;
  @JsonKey(name: "_id")
  String? id;

  ScheduleTimingResponse(
    this.start,
    this.end,
    this.id,
  );

  factory ScheduleTimingResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleTimingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleTimingResponseToJson(this);
}

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
