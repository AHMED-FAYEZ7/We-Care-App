// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/base_response.dart';

part 'user_response.g.dart';

/////////////////////// user login  ///////////////////////////

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "specialization")
  String? specialization;
  @JsonKey(name: "fees")
  int? fees;
  @JsonKey(name: "timePerPatient")
  int? timePerPatient;
  @JsonKey(name: "ScheduleTiming")
  List<ScheduleTimingResponse>? scheduleTiming;
  @JsonKey(name: "patients")
  List<String>? patients;
  @JsonKey(name: "appointments")
  List<String>? appointments;
  @JsonKey(name: "numberOfRating")
  double? numberOfRating;
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
  @JsonKey(name: "profilePicture")
  String? profilePicture;
  @JsonKey(name: "confirmed")
  bool? confirmed;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "__t")
  String? type;
  @JsonKey(name: "address")
  List<String>? address;
  @JsonKey(name: "username")
  String? userName;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "emailConfirm")
  String? emailConfirm;

  UserResponse(
    this.specialization,
    this.fees,
    this.timePerPatient,
    this.scheduleTiming,
    this.patients,
    this.appointments,
    this.numberOfRating,
    this.averageRating,
    this.status,
    this.id,
    this.name,
    this.email,
    this.profilePicture,
    this.confirmed,
    this.active,
    this.type,
    this.address,
    this.userName,
    this.v,
    this.emailConfirm,
  );

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserDataResponse extends BaseResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserResponse? user;

  UserDataResponse(
    super.status,
    super.message,
    this.token,
    this.user,
  );

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}

/////////////////// user forget password ///////////////////////
@JsonSerializable()
class UserForgetPasswordResponse extends BaseResponse {
  UserForgetPasswordResponse(
    super.status,
    super.message,
  );

  factory UserForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UserForgetPasswordResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserForgetPasswordResponseToJson(this);
}

/////////////////// user update password ///////////////////////
@JsonSerializable()
class UserUpdatePasswordResponse extends BaseResponse {
  @JsonKey(name: "token")
  String? token;

  UserUpdatePasswordResponse(
    super.status,
    super.message,
    this.token,
  );

  factory UserUpdatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UserUpdatePasswordResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserUpdatePasswordResponseToJson(this);
}

/////////////////// user email confirmation ///////////////////////
@JsonSerializable()
class UserEmailConfirmationResponse extends BaseResponse {
  UserEmailConfirmationResponse(
    super.status,
    super.message,
  );

  factory UserEmailConfirmationResponse.fromJson(Map<String, dynamic> json) =>
      _$UserEmailConfirmationResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserEmailConfirmationResponseToJson(this);
}

/////////////////// user update info ///////////////////////
@JsonSerializable()
class UserUpdateInfoResponse extends BaseResponse {
  @JsonKey(name: "data")
  UserResponse? user;

  UserUpdateInfoResponse(
    super.status,
    super.message,
    this.user,
  );

  factory UserUpdateInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserUpdateInfoResponseToJson(this);
}
