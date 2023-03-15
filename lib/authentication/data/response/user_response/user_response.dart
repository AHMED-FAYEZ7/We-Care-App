// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/base_response.dart';

part 'user_response.g.dart';

/////////////////////// user login  ///////////////////////////
@JsonSerializable()
class UserResponse {
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
  @JsonKey(name: "__t")
  String? type;
  @JsonKey(name: "username")
  String? userName;
  @JsonKey(name: "__v")
  int? v;

  UserResponse(
    this.appointments,
    this.id,
    this.name,
    this.email,
    this.confirmed,
    this.type,
    this.userName,
    this.v,
  );

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  @JsonKey(name: "user")
  UserResponse? user;

  DataResponse(this.user);

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class UserDataResponse extends BaseResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "data")
  DataResponse? data;

  UserDataResponse(
    super.status,
    super.message,
    this.token,
    this.data,
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
