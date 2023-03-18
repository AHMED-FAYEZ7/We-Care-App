// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      (json['appointments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['_id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['confirmed'] as bool?,
      json['__t'] as String?,
      json['username'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'appointments': instance.appointments,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'confirmed': instance.confirmed,
      '__t': instance.type,
      'username': instance.userName,
      '__v': instance.v,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['token'] as String?,
      json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'data': instance.data,
    };

UserForgetPasswordResponse _$UserForgetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    UserForgetPasswordResponse(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$UserForgetPasswordResponseToJson(
        UserForgetPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

UserUpdatePasswordResponse _$UserUpdatePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    UserUpdatePasswordResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$UserUpdatePasswordResponseToJson(
        UserUpdatePasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };

UserEmailConfirmationResponse _$UserEmailConfirmationResponseFromJson(
        Map<String, dynamic> json) =>
    UserEmailConfirmationResponse(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$UserEmailConfirmationResponseToJson(
        UserEmailConfirmationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

UserUpdateInfoResponse _$UserUpdateInfoResponseFromJson(
        Map<String, dynamic> json) =>
    UserUpdateInfoResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpdateInfoResponseToJson(
        UserUpdateInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
