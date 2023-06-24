// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/response/base_response.dart';

part 'patient_response.g.dart';

@JsonSerializable()
class DoctorInfResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? resultsResponse;

  @JsonKey(name: "doctorsNum")
  int? doctorsNumResponse;

  @JsonKey(name: "allDoctors")
  List<UserResponse>? allDoctorsResponse;

  @JsonKey(name: 'searchedDoctors')
  List<UserResponse>? doctorsSearchDataResponse;

  @JsonKey(name: 'topDoctors')
  List<UserResponse>? topDoctorsDataResponse;

  @JsonKey(name: 'specializedDoctors')
  List<UserResponse>? specializedDoctorsDataResponse;

  DoctorInfResponse(
    super.status,
    super.message,
    this.resultsResponse,
    this.doctorsNumResponse,
    this.allDoctorsResponse,
    this.doctorsSearchDataResponse,
    this.topDoctorsDataResponse,
    this.specializedDoctorsDataResponse,
  );

  factory DoctorInfResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('allDoctors')) {
      return _$DoctorInfResponseFromJson(json);
    } else if (json.containsKey('searchedDoctors')) {
      return _$DoctorInfResponseFromJson(json);
    } else if (json.containsKey('specializedDoctors')) {
      return _$DoctorInfResponseFromJson(json);
    } else if (json.containsKey('topDoctors')) {
      return _$DoctorInfResponseFromJson(json);
    } else {
      throw ArgumentError('Invalid JSON structure for AllDoctorsResponse');
    }
  }

  @override
  Map<String, dynamic> toJson() => _$DoctorInfResponseToJson(this);
}

@JsonSerializable()
class DoctorByIdResponse implements UserDataResponse {
  @override
  @JsonKey(name: "doctor")
  UserResponse? user;

  @override
  @JsonKey(name: "message")
  String? message;

  @override
  @JsonKey(name: "status")
  String? status;

  @override
  @JsonKey(name: "token")
  String? token;

  factory DoctorByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorByIdResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DoctorByIdResponseToJson(this);

  DoctorByIdResponse(
    this.user,
    this.message,
    this.status,
    this.token,
  );
}
