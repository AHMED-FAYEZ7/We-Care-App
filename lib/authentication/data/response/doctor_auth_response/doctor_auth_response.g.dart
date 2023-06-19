// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAuthResponse _$DoctorAuthResponseFromJson(Map<String, dynamic> json) =>
    DoctorAuthResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['token'] as String?,
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorAuthResponseToJson(DoctorAuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
